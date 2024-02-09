From: Nicholas Piggin <npiggin@gmail.com>
Date: Fri,  9 Feb 2024 19:11:32 +1000
Subject: [kvm-unit-tests PATCH v4 6/8] migration: Add quiet migration support
In-Reply-To: <20240209091134.600228-1-npiggin@gmail.com>
References: <20240209091134.600228-1-npiggin@gmail.com>
Message-ID: <20240209091134.600228-7-npiggin@gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Console output required to support migration becomes quite noisy
when doing lots of migrations. Provide a migrate_quiet() call that
suppresses console output and doesn't log a message.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 lib/migrate.c         | 11 +++++++++++
 lib/migrate.h         |  1 +
 scripts/arch-run.bash |  4 ++--
 3 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/lib/migrate.c b/lib/migrate.c
index b7721659..92d1d957 100644
--- a/lib/migrate.c
+++ b/lib/migrate.c
@@ -18,6 +18,17 @@ void migrate(void)
 	report_info("Migration complete");
 }
 
+/*
+ * Like migrate() but suppress output and logs, useful for intensive
+ * migration stress testing without polluting logs. Test cases should
+ * provide relevant information about migration in failure reports.
+ */
+void migrate_quiet(void)
+{
+	puts("Now migrate the VM (quiet)\n");
+	(void)getchar();
+}
+
 /*
  * Initiate migration and wait for it to complete.
  * If this function is called more than once, it is a no-op.
diff --git a/lib/migrate.h b/lib/migrate.h
index 2af06a72..95b9102b 100644
--- a/lib/migrate.h
+++ b/lib/migrate.h
@@ -7,4 +7,5 @@
  */
 
 void migrate(void);
+void migrate_quiet(void);
 void migrate_once(void);
diff --git a/scripts/arch-run.bash b/scripts/arch-run.bash
index c98429e8..0a98e512 100644
--- a/scripts/arch-run.bash
+++ b/scripts/arch-run.bash
@@ -152,7 +152,7 @@ run_migration ()
 		-chardev socket,id=mon,path=${src_qmp},server=on,wait=off \
 		-mon chardev=mon,mode=control > ${src_outfifo} &
 	live_pid=$!
-	cat ${src_outfifo} | tee ${src_out} &
+	cat ${src_outfifo} | tee ${src_out} | grep -v "Now migrate the VM (quiet)" &
 
 	# Start the first destination QEMU machine in advance of the test
 	# reaching the migration point, since we expect at least one migration.
@@ -190,7 +190,7 @@ do_migration ()
 		-mon chardev=mon,mode=control -incoming unix:${dst_incoming} \
 		< <(cat ${dst_infifo}) > ${dst_outfifo} &
 	incoming_pid=$!
-	cat ${dst_outfifo} | tee ${dst_out} &
+	cat ${dst_outfifo} | tee ${dst_out} | grep -v "Now migrate the VM (quiet)" &
 
 	# The test must prompt the user to migrate, so wait for the
 	# "Now migrate VM" console message.
-- 
2.42.0


