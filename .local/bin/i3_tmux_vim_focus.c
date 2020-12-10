/* File: i3_vim_focus.c
 *
 * Compile with:
 * gcc i3_tmux_vim_focus.c -lX11 -lxdo -o i3_tmux_vim_focus $(pkg-config --libs --cflags i3ipc-glib-1.0)
 *
 */

#include <stdio.h>

#include <strings.h>
#include <string.h>

#include <xdo.h>

#include <glib/gprintf.h>
#include <i3ipc-glib/i3ipc-glib.h>

int main(int argc, char *argv[]) {

    char cmd[20];

    unsigned char *name;
    int name_len;
    int name_type;
    Window window_ret;

    i3ipcConnection *conn;
    gchar *reply;

    if(argc < 2){
        printf("Missing argument\n");
        return 1;
    }

    xdo_t *xdo = xdo_new(NULL);
    xdo_get_active_window(xdo, &window_ret);
    xdo_get_window_name(xdo, window_ret, &name, &name_len, &name_type);

    if(strstr(name, "VIM") || strstr(name, "vim"))
    {
        strcpy(cmd, "Ctrl+c+Ctrl+");


        strcat(cmd, (argv[1][0] == 'l')? "h" :
                    (argv[1][0] == 'd')? "j" :
                    (argv[1][0] == 'u')? "k" :
                                         "l" );
        xdo_send_keysequence_window(xdo, window_ret, cmd, 0);
    }
    else if(strstr(name, "tmux"))
    {
        strcpy(cmd, "ctrl+a");


        xdo_send_keysequence_window(xdo, window_ret, cmd, 0);
        strcpy(cmd, (argv[1][0] == 'l')? "Left" :
                    (argv[1][0] == 'd')? "Down" :
                    (argv[1][0] == 'u')? "Up" :
                                         "Right" );

        xdo_send_keysequence_window(xdo, window_ret, cmd, 0);
    }
    else
    {
        conn = i3ipc_connection_new(NULL, NULL);
        strcpy(cmd, "focus ");
        strcat(cmd, argv[1]);
        reply = i3ipc_connection_message(conn, I3IPC_MESSAGE_TYPE_COMMAND, cmd, NULL);
        g_free(reply);
        g_object_unref(conn);
    }

    XFree(name);
    return  0;
}
