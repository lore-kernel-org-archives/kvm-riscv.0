From: Andrew Jones <andrew.jones@linux.dev>
Date: Wed, 24 Jan 2024 08:18:38 +0100
Subject: [kvm-unit-tests PATCH 22/24] riscv: Add isa string parsing
In-Reply-To: <20240124071815.6898-26-andrew.jones@linux.dev>
References: <20240124071815.6898-26-andrew.jones@linux.dev>
Message-ID: <20240124071815.6898-48-andrew.jones@linux.dev>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We can probably get away with just assuming several important
and popular extensions (at least everything covered by G), but
we'll also want to use some extensions which we should ensure
are present by parsing the isa string. Add a parser and already
apply it to Sstc.

Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 lib/riscv/asm/isa.h       | 18 +++++++++
 lib/riscv/asm/processor.h |  1 +
 lib/riscv/processor.c     | 84 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 103 insertions(+)
 create mode 100644 lib/riscv/asm/isa.h

diff --git a/lib/riscv/asm/isa.h b/lib/riscv/asm/isa.h
new file mode 100644
index 000000000000..4cb467b77077
--- /dev/null
+++ b/lib/riscv/asm/isa.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _ASMRISCV_ISA_H_
+#define _ASMRISCV_ISA_H_
+#include <bitops.h>
+#include <asm/setup.h>
+
+enum {
+	ISA_SSTC,
+	ISA_MAX,
+};
+_Static_assert(ISA_MAX <= __riscv_xlen, "Need to increase thread_info.isa");
+
+static inline bool cpu_has_extension(int cpu, int ext)
+{
+	return test_bit(ext, cpus[cpu].isa);
+}
+
+#endif /* _ASMRISCV_ISA_H_ */
diff --git a/lib/riscv/asm/processor.h b/lib/riscv/asm/processor.h
index d8b7018c9102..928a988b471a 100644
--- a/lib/riscv/asm/processor.h
+++ b/lib/riscv/asm/processor.h
@@ -11,6 +11,7 @@ typedef void (*exception_fn)(struct pt_regs *);
 struct thread_info {
 	int cpu;
 	unsigned long hartid;
+	unsigned long isa[1];
 	exception_fn exception_handlers[EXCEPTION_CAUSE_MAX];
 };
 
diff --git a/lib/riscv/processor.c b/lib/riscv/processor.c
index 7248cf4c5ca6..02ac35890ded 100644
--- a/lib/riscv/processor.c
+++ b/lib/riscv/processor.c
@@ -3,7 +3,11 @@
  * Copyright (C) 2023, Ventana Micro Systems Inc., Andrew Jones <ajones@ventanamicro.com>
  */
 #include <libcflat.h>
+#include <bitops.h>
+#include <devicetree.h>
+#include <string.h>
 #include <asm/csr.h>
+#include <asm/isa.h>
 #include <asm/processor.h>
 #include <asm/setup.h>
 
@@ -53,10 +57,90 @@ void install_exception_handler(unsigned long cause, void (*handler)(struct pt_re
 	info->exception_handlers[cause] = handler;
 }
 
+static int isa_bit(const char *name, int len)
+{
+	/*
+	 * We assume and use several extensions, such as Zicsr and Zifencei.
+	 * Here we only look for extensions which we don't assume and still
+	 * may want to use.
+	 */
+#define ISA_CMP(name, len, ext) \
+	((len) == sizeof(ext) - 1 && !strncasecmp(name, ext, len))
+
+	if (ISA_CMP(name, len, "sstc"))
+		return ISA_SSTC;
+
+#undef ISA_CMP
+	return ISA_MAX;
+}
+
+static void isa_parse(unsigned long *isa, const char *isa_string, int len)
+{
+	assert(isa_string[0] == 'r' && isa_string[1] == 'v');
+#if __riscv_xlen == 32
+	assert(isa_string[2] == '3' && isa_string[3] == '2');
+#else
+	assert(isa_string[2] == '6' && isa_string[3] == '4');
+#endif
+
+	for (int i = 4; i < len; ++i) {
+		int nr;
+
+		if (isa_string[i] == '_') {
+			const char *multi = &isa_string[++i];
+			int start = i;
+
+			while (i < len && isa_string[i] != '_')
+				++i;
+			nr = isa_bit(multi, i - start);
+			if (i < len)
+				--i;
+		} else {
+			nr = isa_bit(&isa_string[i], 1);
+		}
+
+		if (nr < ISA_MAX)
+			set_bit(nr, isa);
+	}
+}
+
+static void isa_init_fdt(int cpu_node, u64 hartid, void *data)
+{
+	struct thread_info *info = (struct thread_info *)data;
+	const struct fdt_property *prop;
+	int len;
+
+	if (hartid != info->hartid)
+		return;
+
+	prop = fdt_get_property(dt_fdt(), cpu_node, "riscv,isa", &len);
+	assert(prop);
+
+	isa_parse(info->isa, prop->data, len);
+}
+
+static void isa_init_acpi(void)
+{
+	assert_msg(false, "ACPI not available");
+}
+
+static void isa_init(struct thread_info *info)
+{
+	int ret;
+
+	if (dt_available()) {
+		ret = dt_for_each_cpu_node(isa_init_fdt, info);
+		assert(ret == 0);
+	} else {
+		isa_init_acpi();
+	}
+}
+
 void thread_info_init(void)
 {
 	unsigned long hartid = csr_read(CSR_SSCRATCH);
 	int cpu = hartid_to_cpu(hartid);
 
+	isa_init(&cpus[cpu]);
 	csr_write(CSR_SSCRATCH, &cpus[cpu]);
 }
-- 
2.43.0


