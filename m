Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B424C7EE30
	for <kvm-riscv@archiver.kernel.org>; Tue,  1 Jul 2025 20:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rDQ5hrMPIn7yOkngvckIo7jCHmws6p699sMlmmPsu7g=; b=hOAsTrg4MT8T1c
	OVf+C5u26mOzqDWeDTDS2WMwy7YC5fjT32Fb2Bq/pib2HjT6Tl0ukxYp9pgR0QxgfOlOAu+5i28H7
	BUq8eYPMVasyJN5BiEIgj2phpZY/Kw/Gju9A770ExFLMyqF42PT4SJGidPEyUrGtIktkqjCNmn92I
	Su4wlhc1N6mkw0zQLK8L0jL9zSKGR6/o1ZzQQRpyim0pRp3BZOtA/QPCd+wuTgQ+KsItpm1Dxc9zF
	yCMVzpN6/iMQy/uLHstWB5f4H9LV5L9mJ/C8i0pYHrldh/f0+eX6O0iDVn/qOryE6mc2o6YS997pL
	oJ16k3z0N6SUbEIoRJPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWhA7-00000006WZT-37TR;
	Tue, 01 Jul 2025 20:01:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWhA5-00000006WYo-3e3m
	for kvm-riscv@bombadil.infradead.org;
	Tue, 01 Jul 2025 20:01:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=7gT9KU2DHUO6wiBS867W/RUbF9POiOZDT89LSKeAocM=; b=kqS+2SpCbDB8oUAYZHGVVhbd8+
	hB62bFQ4mfgp9/3n3tN+Oxu6ckJhmJP5Xvq9zkBdh3h4FzsfqyRZp0Xhat8CyrR/zV4aKDfCG5vsi
	Gjdy+v357TL5c9uUiB3711yMiz5StP/T6NreYjAIeuylvFmZAIk7UIKDRAdiIsNk06X6qUY99mdH8
	9qswvdea7yl1X3DqAHxTkTCBwTCFwLxYricsBk/m64bIT7gtUS6hFEe1vNdWWyK5TEf1kYJTVXoW6
	XQ4iix87H25NNr8UlUbyVVdUjbrFajj4d4zoeW0YbZIfEmTIWjNAv9WhGxBD+N05WNX9fzuhbHaai
	/OfHBboA==;
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWhA1-00000007BRC-2DHB
	for kvm-riscv@lists.infradead.org;
	Tue, 01 Jul 2025 20:01:00 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-6fafd3cc8f9so61196906d6.3
        for <kvm-riscv@lists.infradead.org>; Tue, 01 Jul 2025 13:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1751400053; x=1752004853; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7gT9KU2DHUO6wiBS867W/RUbF9POiOZDT89LSKeAocM=;
        b=dDZIy5aoCo9xjp4KwxKDvRLjMyCY9yF+hCgyqWjfcA7WvlDbdFsON8TTLBnFPXjNqm
         o8xZ5wqREgUFKHgbdXQRnHrepkCUIVyysGke43Bh6+GRRVTAlODkl8PD+/4M5VDgJgqV
         6lzADsWXoDWdM03GCUfCxWYGdOGHjWR+UjaShxnwT/sE/4wV1Cn+MxZxg9biE1aHth/L
         cEud9y8Qk94LLd1LHYZrVhNkKZwEjy6Od8HAdwBH940vHtq3rYbJ2W2UMT/dza9dcRfy
         6xbLtwXemgU5QDbPT8et0unUPTSZn1sIOPaE2PNVjM8Vv+jvbFMHiDGAkXxyIgTBmjpE
         De9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751400053; x=1752004853;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7gT9KU2DHUO6wiBS867W/RUbF9POiOZDT89LSKeAocM=;
        b=VB1F/mQBWX2fodky29atI9yqzyZ6KB6XbcYjB8zY40jb1xLXFagsu+Tn2o2tqkRV04
         QR+ixFv+4DTS4gTm4ctN3uqxkZ20RAl0zqwp03T3jQd+icXQKnR8QqkLMp4HLuRrnLlM
         iA1ri4E1UqhuaqZd1wja9uld+LOwq+eKVuYgxjhwESzRGdxYXdxj6st3UodOV6kwYtr1
         LCzBWhi1vfFeWFUwZfAAIlf2UMN4Dg35/JMgtTY668Bp8xQUxLYVgR4/BU2T4o8jD5uG
         hQQSkOEChf+Dc3kwSrf3wAy5j7B/DyQznOr8iByB850QMNA0PvKZnNvbLKiuAsgwKnj2
         A5Og==
X-Forwarded-Encrypted: i=1; AJvYcCVx/oou7U+Up+hcbn+xZEK90tGuQDkgcbBpGhTK9JNQU7GN9oil4XWiV4qTOvfXfiBmDVwNvBWSpd4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzru8rL23x2njkavHJTnN/4oskG3IG8yCNf17LBI+9ZWbEP7AAC
	MZYd8eUVYDlFpb5EWvAqAzMrGjOsrgpIHDJ8jbjxA5LehOQYSrNITAUTGBWgb3OEYtA=
X-Gm-Gg: ASbGncuOuC4k4chVI+hwT1EBtsEs51bwhZLmzOjtjJ5SsyPUaG00paklmnxUjabSBEi
	sK3M7ZZZCP7OgmCImsVzv4MdYmoTWJREr1KMTU+/I6t/a0/AJYE8UILzJaPA0n8sCeNc/wjYQPH
	uDHn0Ul1V966x3llg5tSlaf/EaqhVL+csc5aU5dMgoFiZ0fkpJEeqNowBHZIrCkJ5ymyyJCW5ky
	i6zGjU8thgURa6Rz0gaC8jHnDpqhv5WSOqny5CyxOk9xGj5B6i46uusG2aOP1p6xyWW1nP6RIjN
	ek06aPIP9HCFAfGcwhyImcbK6lIdCIn1k0ehuorZifRS98CllCriOMLoAxcJw/Nc8jxQ+MIxH+U
	=
X-Google-Smtp-Source: AGHT+IEp4tCCTAHKP7uN0eNNNAIstlCM+dsjw2VFF/VJEG98xLU4caRT8sIiJfsWLQ5cP1SsouYB9g==
X-Received: by 2002:a05:6214:5a08:b0:6ed:19d1:212f with SMTP id 6a1803df08f44-6ffed7a5801mr318145296d6.5.1751400048671;
        Tue, 01 Jul 2025 13:00:48 -0700 (PDT)
Received: from jesse-lt.ba.rivosinc.com ([96.224.57.66])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd772e4305sm89176786d6.66.2025.07.01.13.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 13:00:48 -0700 (PDT)
From: Jesse Taube <jesse@rivosinc.com>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Cc: Atish Patra <atish.patra@linux.dev>,
	Anup Patel <anup@brainfault.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Himanshu Chauhan <hchauhan@ventanamicro.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Jesse Taube <jesse@rivosinc.com>,
	Andrew Jones <andrew.jones@linux.dev>
Subject: [kvm-unit-tests PATCH v8] riscv: sbi: Add SBI Debug Triggers Extension tests
Date: Tue,  1 Jul 2025 13:00:47 -0700
Message-ID: <20250701200047.1367077-1-jesse@rivosinc.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_210058_052989_4BC645DD 
X-CRM114-Status: GOOD (  21.56  )
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

Add tests for the DBTR SBI extension.

Signed-off-by: Jesse Taube <jesse@rivosinc.com>
Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
Tested-by: Charlie Jenkins <charlie@rivosinc.com>
---
V1 -> V2:
 - Call report_prefix_pop before returning
 - Disable compressed instructions in exec_call, update related comment
 - Remove extra "| 1" in dbtr_test_load
 - Remove extra newlines
 - Remove extra tabs in check_exec
 - Remove typedefs from enums
 - Return when dbtr_install_trigger fails
 - s/avalible/available/g
 - s/unistall/uninstall/g
V2 -> V3:
 - Change SBI_DBTR_SHMEM_INVALID_ADDR to -1UL
 - Move all dbtr functions to sbi-dbtr.c
 - Move INSN_LEN to processor.h
 - Update include list
 - Use C-style comments
V3 -> V4:
 - Include libcflat.h
 - Remove #define SBI_DBTR_SHMEM_INVALID_ADDR
V4 -> V5:
 - Sort includes
 - Add kfail for update triggers
V5 -> V6:
 - Add assert in gen_tdata1
 - Add prefix to dbtr_test_type
 - Add TRIG_STATE_DMODE
 - Add TRIG_STATE_RESERVED
 - Align function paramaters with opening parenthesis
 - Change OpenSBI < v1.7 to < v1.5
 - Constantly use spaces in prefix rather than _
 - Export split_phys_addr
 - Fix MCONTROL_U and MCONTROL_M mix up
 - Fix swapped VU and VS
 - Move /* to own line
 - Print type in dbtr_test_type
 - Remove _BIT suffix from macros
 - Remove duplicate MODE_S
 - Remove spaces before include
 - Rename tdata1,2 to trigger and control in dbtr_install_trigger
 - Report skip in dbtr_test_multiple
 - Report variables in info not pass or fail
 - s/save/store/g
 - sbi_debug_set_shmem use split_phys_addr
 - Use if (!report(... in dbtr_test_disable_enable
V6 -> V7:
 - Alphabetize Makefile
 - Only print read info on failure
 - Remove return after assert
 - Remove unnecessary OpenSBI version check
 - Rename error to exit_test in check_dbtr
 - Use prefix in dbtr_test_num_triggers and dbtr_test_type
V7 -> V8:
 - Add mcontrol_size mcontrol6_size
 - Cast McontrolType to int for assert
 - Set trigger size to 32BIT using mcontrol_size
Debug triggers allow traps on different access sizes, which was set to
any. QEMU was triggering on a 32BIT access next to the trigger address
causing an erroneous trap. Set the size to 32BITs to avoid this.
---
 lib/riscv/asm/sbi.h |   1 +
 riscv/Makefile      |   1 +
 riscv/sbi-dbtr.c    | 867 ++++++++++++++++++++++++++++++++++++++++++++
 riscv/sbi-tests.h   |   2 +
 riscv/sbi.c         |   3 +-
 5 files changed, 873 insertions(+), 1 deletion(-)
 create mode 100644 riscv/sbi-dbtr.c

diff --git a/lib/riscv/asm/sbi.h b/lib/riscv/asm/sbi.h
index a5738a5c..78fd6e2a 100644
--- a/lib/riscv/asm/sbi.h
+++ b/lib/riscv/asm/sbi.h
@@ -51,6 +51,7 @@ enum sbi_ext_id {
 	SBI_EXT_SUSP = 0x53555350,
 	SBI_EXT_FWFT = 0x46574654,
 	SBI_EXT_SSE = 0x535345,
+	SBI_EXT_DBTR = 0x44425452,
 };
 
 enum sbi_ext_base_fid {
diff --git a/riscv/Makefile b/riscv/Makefile
index 11e68eae..9309ac12 100644
--- a/riscv/Makefile
+++ b/riscv/Makefile
@@ -18,6 +18,7 @@ tests += $(TEST_DIR)/sieve.$(exe)
 all: $(tests)
 
 $(TEST_DIR)/sbi-deps += $(TEST_DIR)/sbi-asm.o
+$(TEST_DIR)/sbi-deps += $(TEST_DIR)/sbi-dbtr.o
 $(TEST_DIR)/sbi-deps += $(TEST_DIR)/sbi-fwft.o
 $(TEST_DIR)/sbi-deps += $(TEST_DIR)/sbi-sse.o
 
diff --git a/riscv/sbi-dbtr.c b/riscv/sbi-dbtr.c
new file mode 100644
index 00000000..13f64015
--- /dev/null
+++ b/riscv/sbi-dbtr.c
@@ -0,0 +1,867 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * SBI DBTR testsuite
+ *
+ * Copyright (C) 2025, Rivos Inc., Jesse Taube <jesse@rivosinc.com>
+ */
+
+#include <libcflat.h>
+#include <bitops.h>
+
+#include <asm/io.h>
+#include <asm/processor.h>
+
+#include "sbi-tests.h"
+
+#define RV_MAX_TRIGGERS			32
+
+#define SBI_DBTR_TRIG_STATE_MAPPED		BIT(0)
+#define SBI_DBTR_TRIG_STATE_U			BIT(1)
+#define SBI_DBTR_TRIG_STATE_S			BIT(2)
+#define SBI_DBTR_TRIG_STATE_VU			BIT(3)
+#define SBI_DBTR_TRIG_STATE_VS			BIT(4)
+#define SBI_DBTR_TRIG_STATE_HAVE_HW_TRIG	BIT(5)
+#define SBI_DBTR_TRIG_STATE_RESERVED		GENMASK(7, 6)
+
+#define SBI_DBTR_TRIG_STATE_HW_TRIG_IDX_SHIFT		8
+#define SBI_DBTR_TRIG_STATE_HW_TRIG_IDX(trig_state)	(trig_state >> SBI_DBTR_TRIG_STATE_HW_TRIG_IDX_SHIFT)
+
+#define SBI_DBTR_TDATA1_TYPE_SHIFT		(__riscv_xlen - 4)
+#define SBI_DBTR_TDATA1_DMODE			BIT_UL(__riscv_xlen - 5)
+
+#define SBI_DBTR_TDATA1_MCONTROL6_LOAD		BIT(0)
+#define SBI_DBTR_TDATA1_MCONTROL6_STORE		BIT(1)
+#define SBI_DBTR_TDATA1_MCONTROL6_EXECUTE	BIT(2)
+#define SBI_DBTR_TDATA1_MCONTROL6_U		BIT(3)
+#define SBI_DBTR_TDATA1_MCONTROL6_S		BIT(4)
+#define SBI_DBTR_TDATA1_MCONTROL6_M		BIT(6)
+#define SBI_DBTR_TDATA1_MCONTROL6_SIZE_SHIFT	16
+#define SBI_DBTR_TDATA1_MCONTROL6_SIZE_MASK	0x7
+#define SBI_DBTR_TDATA1_MCONTROL6_SELECT	BIT(21)
+#define SBI_DBTR_TDATA1_MCONTROL6_VU		BIT(23)
+#define SBI_DBTR_TDATA1_MCONTROL6_VS		BIT(24)
+
+#define SBI_DBTR_TDATA1_MCONTROL_LOAD		BIT(0)
+#define SBI_DBTR_TDATA1_MCONTROL_STORE		BIT(1)
+#define SBI_DBTR_TDATA1_MCONTROL_EXECUTE	BIT(2)
+#define SBI_DBTR_TDATA1_MCONTROL_U		BIT(3)
+#define SBI_DBTR_TDATA1_MCONTROL_S		BIT(4)
+#define SBI_DBTR_TDATA1_MCONTROL_M		BIT(6)
+#define SBI_DBTR_TDATA1_MCONTROL_SIZELO_SHIFT	16
+#define SBI_DBTR_TDATA1_MCONTROL_SIZELO_MASK	0x3
+#define SBI_DBTR_TDATA1_MCONTROL_SELECT		BIT(19)
+#define SBI_DBTR_TDATA1_MCONTROL_SIZEHI_SHIFT	21
+#define SBI_DBTR_TDATA1_MCONTROL_SIZEHI_MASK	0x3
+
+enum McontrolType {
+	SBI_DBTR_TDATA1_TYPE_NONE =		(0UL << SBI_DBTR_TDATA1_TYPE_SHIFT),
+	SBI_DBTR_TDATA1_TYPE_LEGACY =		(1UL << SBI_DBTR_TDATA1_TYPE_SHIFT),
+	SBI_DBTR_TDATA1_TYPE_MCONTROL =		(2UL << SBI_DBTR_TDATA1_TYPE_SHIFT),
+	SBI_DBTR_TDATA1_TYPE_ICOUNT =		(3UL << SBI_DBTR_TDATA1_TYPE_SHIFT),
+	SBI_DBTR_TDATA1_TYPE_ITRIGGER =		(4UL << SBI_DBTR_TDATA1_TYPE_SHIFT),
+	SBI_DBTR_TDATA1_TYPE_ETRIGGER =		(5UL << SBI_DBTR_TDATA1_TYPE_SHIFT),
+	SBI_DBTR_TDATA1_TYPE_MCONTROL6 =	(6UL << SBI_DBTR_TDATA1_TYPE_SHIFT),
+	SBI_DBTR_TDATA1_TYPE_TMEXTTRIGGER =	(7UL << SBI_DBTR_TDATA1_TYPE_SHIFT),
+	SBI_DBTR_TDATA1_TYPE_RESERVED0 =	(8UL << SBI_DBTR_TDATA1_TYPE_SHIFT),
+	SBI_DBTR_TDATA1_TYPE_RESERVED1 =	(9UL << SBI_DBTR_TDATA1_TYPE_SHIFT),
+	SBI_DBTR_TDATA1_TYPE_RESERVED2 =	(10UL << SBI_DBTR_TDATA1_TYPE_SHIFT),
+	SBI_DBTR_TDATA1_TYPE_RESERVED3 =	(11UL << SBI_DBTR_TDATA1_TYPE_SHIFT),
+	SBI_DBTR_TDATA1_TYPE_CUSTOM0 =		(12UL << SBI_DBTR_TDATA1_TYPE_SHIFT),
+	SBI_DBTR_TDATA1_TYPE_CUSTOM1 =		(13UL << SBI_DBTR_TDATA1_TYPE_SHIFT),
+	SBI_DBTR_TDATA1_TYPE_CUSTOM2 =		(14UL << SBI_DBTR_TDATA1_TYPE_SHIFT),
+	SBI_DBTR_TDATA1_TYPE_DISABLED =		(15UL << SBI_DBTR_TDATA1_TYPE_SHIFT),
+};
+
+enum Tdata1Size {
+	SIZE_ANY = 0,
+	SIZE_8BIT,
+	SIZE_16BIT,
+	SIZE_32BIT,
+	SIZE_48BIT,
+	SIZE_64BIT,
+};
+
+enum Tdata1Value {
+	VALUE_NONE =	0,
+	VALUE_LOAD =	BIT(0),
+	VALUE_STORE =	BIT(1),
+	VALUE_EXECUTE =	BIT(2),
+};
+
+enum Tdata1Mode {
+	MODE_NONE =	0,
+	MODE_M =	BIT(0),
+	MODE_U =	BIT(1),
+	MODE_S =	BIT(2),
+	MODE_VU =	BIT(3),
+	MODE_VS =	BIT(4),
+};
+
+enum sbi_ext_dbtr_fid {
+	SBI_EXT_DBTR_NUM_TRIGGERS = 0,
+	SBI_EXT_DBTR_SETUP_SHMEM,
+	SBI_EXT_DBTR_TRIGGER_READ,
+	SBI_EXT_DBTR_TRIGGER_INSTALL,
+	SBI_EXT_DBTR_TRIGGER_UPDATE,
+	SBI_EXT_DBTR_TRIGGER_UNINSTALL,
+	SBI_EXT_DBTR_TRIGGER_ENABLE,
+	SBI_EXT_DBTR_TRIGGER_DISABLE,
+};
+
+struct sbi_dbtr_data_msg {
+	unsigned long tstate;
+	unsigned long tdata1;
+	unsigned long tdata2;
+	unsigned long tdata3;
+};
+
+struct sbi_dbtr_id_msg {
+	unsigned long idx;
+};
+
+/* SBI shared mem messages layout */
+struct sbi_dbtr_shmem_entry {
+	union {
+		struct sbi_dbtr_data_msg data;
+		struct sbi_dbtr_id_msg id;
+	};
+};
+
+static bool dbtr_handled;
+
+/* Expected to be leaf function as not to disrupt frame-pointer */
+static __attribute__((naked)) void exec_call(void)
+{
+	/* skip over nop when triggered instead of ret. */
+	asm volatile (".option push\n"
+		      ".option arch, -c\n"
+		      "nop\n"
+		      "ret\n"
+		      ".option pop\n");
+}
+
+static void dbtr_exception_handler(struct pt_regs *regs)
+{
+	dbtr_handled = true;
+
+	/* Reading *epc may cause a fault, skip over nop */
+	if ((void *)regs->epc == exec_call) {
+		regs->epc += 4;
+		return;
+	}
+
+	/* WARNING: Skips over the trapped intruction */
+	regs->epc += RV_INSN_LEN(readw((void *)regs->epc));
+}
+
+static bool do_store(void *tdata2)
+{
+	bool ret;
+
+	writel(0, tdata2);
+
+	ret = dbtr_handled;
+	dbtr_handled = false;
+
+	return ret;
+}
+
+static bool do_load(void *tdata2)
+{
+	bool ret;
+
+	readl(tdata2);
+
+	ret = dbtr_handled;
+	dbtr_handled = false;
+
+	return ret;
+}
+
+static bool do_exec(void)
+{
+	bool ret;
+
+	exec_call();
+
+	ret = dbtr_handled;
+	dbtr_handled = false;
+
+	return ret;
+}
+
+static unsigned long mcontrol_size(enum Tdata1Size mode)
+{
+	unsigned long ret = 0;
+
+	ret |= ((mode >> 2) & SBI_DBTR_TDATA1_MCONTROL_SIZEHI_MASK)
+		<< SBI_DBTR_TDATA1_MCONTROL_SIZEHI_SHIFT;
+	ret |= (mode & SBI_DBTR_TDATA1_MCONTROL_SIZELO_MASK)
+		<< SBI_DBTR_TDATA1_MCONTROL_SIZELO_SHIFT;
+
+	return ret;
+}
+
+static unsigned long mcontrol6_size(enum Tdata1Size mode)
+{
+	return (mode & SBI_DBTR_TDATA1_MCONTROL6_SIZE_MASK)
+		<< SBI_DBTR_TDATA1_MCONTROL6_SIZE_SHIFT;
+}
+
+static unsigned long gen_tdata1_mcontrol(enum Tdata1Mode mode, enum Tdata1Value value)
+{
+	unsigned long tdata1 = SBI_DBTR_TDATA1_TYPE_MCONTROL;
+
+	if (value & VALUE_LOAD)
+		tdata1 |= SBI_DBTR_TDATA1_MCONTROL_LOAD;
+
+	if (value & VALUE_STORE)
+		tdata1 |= SBI_DBTR_TDATA1_MCONTROL_STORE;
+
+	if (value & VALUE_EXECUTE)
+		tdata1 |= SBI_DBTR_TDATA1_MCONTROL_EXECUTE;
+
+	if (mode & MODE_M)
+		tdata1 |= SBI_DBTR_TDATA1_MCONTROL_M;
+
+	if (mode & MODE_U)
+		tdata1 |= SBI_DBTR_TDATA1_MCONTROL_U;
+
+	if (mode & MODE_S)
+		tdata1 |= SBI_DBTR_TDATA1_MCONTROL_S;
+
+	return tdata1;
+}
+
+static unsigned long gen_tdata1_mcontrol6(enum Tdata1Mode mode, enum Tdata1Value value)
+{
+	unsigned long tdata1 = SBI_DBTR_TDATA1_TYPE_MCONTROL6;
+
+	if (value & VALUE_LOAD)
+		tdata1 |= SBI_DBTR_TDATA1_MCONTROL6_LOAD;
+
+	if (value & VALUE_STORE)
+		tdata1 |= SBI_DBTR_TDATA1_MCONTROL6_STORE;
+
+	if (value & VALUE_EXECUTE)
+		tdata1 |= SBI_DBTR_TDATA1_MCONTROL6_EXECUTE;
+
+	if (mode & MODE_M)
+		tdata1 |= SBI_DBTR_TDATA1_MCONTROL6_M;
+
+	if (mode & MODE_U)
+		tdata1 |= SBI_DBTR_TDATA1_MCONTROL6_U;
+
+	if (mode & MODE_S)
+		tdata1 |= SBI_DBTR_TDATA1_MCONTROL6_S;
+
+	if (mode & MODE_VU)
+		tdata1 |= SBI_DBTR_TDATA1_MCONTROL6_VU;
+
+	if (mode & MODE_VS)
+		tdata1 |= SBI_DBTR_TDATA1_MCONTROL6_VS;
+
+	return tdata1;
+}
+
+static unsigned long gen_tdata1(enum McontrolType type, enum Tdata1Value value, enum Tdata1Mode mode)
+{
+	switch (type) {
+	case SBI_DBTR_TDATA1_TYPE_MCONTROL:
+		return gen_tdata1_mcontrol(mode, value) | mcontrol_size(SIZE_32BIT);
+	case SBI_DBTR_TDATA1_TYPE_MCONTROL6:
+		return gen_tdata1_mcontrol6(mode, value) | mcontrol6_size(SIZE_32BIT);
+	default:
+		assert_msg(false, "Invalid mcontrol type: %u", (int)type);
+	}
+}
+
+static struct sbiret sbi_debug_num_triggers(unsigned long trig_tdata1)
+{
+	return sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_NUM_TRIGGERS, trig_tdata1, 0, 0, 0, 0, 0);
+}
+
+static struct sbiret sbi_debug_set_shmem_raw(unsigned long shmem_phys_lo,
+					     unsigned long shmem_phys_hi,
+					     unsigned long flags)
+{
+	return sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_SETUP_SHMEM, shmem_phys_lo,
+			 shmem_phys_hi, flags, 0, 0, 0);
+}
+
+static struct sbiret sbi_debug_set_shmem(void *shmem)
+{
+	unsigned long base_addr_lo, base_addr_hi;
+
+	split_phys_addr(virt_to_phys(shmem), &base_addr_hi, &base_addr_lo);
+	return sbi_debug_set_shmem_raw(base_addr_lo, base_addr_hi, 0);
+}
+
+static struct sbiret sbi_debug_read_triggers(unsigned long trig_idx_base,
+					     unsigned long trig_count)
+{
+	return sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIGGER_READ, trig_idx_base,
+			 trig_count, 0, 0, 0, 0);
+}
+
+static struct sbiret sbi_debug_install_triggers(unsigned long trig_count)
+{
+	return sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIGGER_INSTALL, trig_count, 0, 0, 0, 0, 0);
+}
+
+static struct sbiret sbi_debug_update_triggers(unsigned long trig_count)
+{
+	return sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIGGER_UPDATE, trig_count, 0, 0, 0, 0, 0);
+}
+
+static struct sbiret sbi_debug_uninstall_triggers(unsigned long trig_idx_base,
+						  unsigned long trig_idx_mask)
+{
+	return sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIGGER_UNINSTALL, trig_idx_base,
+			 trig_idx_mask, 0, 0, 0, 0);
+}
+
+static struct sbiret sbi_debug_enable_triggers(unsigned long trig_idx_base,
+					       unsigned long trig_idx_mask)
+{
+	return sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIGGER_ENABLE, trig_idx_base,
+			 trig_idx_mask, 0, 0, 0, 0);
+}
+
+static struct sbiret sbi_debug_disable_triggers(unsigned long trig_idx_base,
+						unsigned long trig_idx_mask)
+{
+	return sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIGGER_DISABLE, trig_idx_base,
+			 trig_idx_mask, 0, 0, 0, 0);
+}
+
+static bool dbtr_install_trigger(struct sbi_dbtr_shmem_entry *shmem, void *trigger,
+				 unsigned long control)
+{
+	struct sbiret sbi_ret;
+	bool ret;
+
+	shmem->data.tdata1 = control;
+	shmem->data.tdata2 = (unsigned long)trigger;
+
+	sbi_ret = sbi_debug_install_triggers(1);
+	ret = sbiret_report_error(&sbi_ret, SBI_SUCCESS, "sbi_debug_install_triggers");
+	if (ret)
+		install_exception_handler(EXC_BREAKPOINT, dbtr_exception_handler);
+
+	return ret;
+}
+
+static bool dbtr_uninstall_trigger(void)
+{
+	struct sbiret ret;
+
+	install_exception_handler(EXC_BREAKPOINT, NULL);
+
+	ret = sbi_debug_uninstall_triggers(0, 1);
+	return sbiret_report_error(&ret, SBI_SUCCESS, "sbi_debug_uninstall_triggers");
+}
+
+static unsigned long dbtr_test_num_triggers(void)
+{
+	struct sbiret ret;
+	unsigned long tdata1 = 0;
+	/* sbi_debug_num_triggers will return trig_max in sbiret.value when trig_tdata1 == 0 */
+
+	report_prefix_push("available triggers");
+
+	/* should be at least one trigger. */
+	ret = sbi_debug_num_triggers(tdata1);
+	sbiret_report_error(&ret, SBI_SUCCESS, "sbi_debug_num_triggers");
+
+	if (ret.value == 0) {
+		report_fail("Returned 0 triggers available");
+	} else {
+		report_pass("Returned triggers available");
+		report_info("Returned %lu triggers available", ret.value);
+	}
+
+	report_prefix_pop();
+	return ret.value;
+}
+
+static enum McontrolType dbtr_test_type(unsigned long *num_trig)
+{
+	struct sbiret ret;
+	unsigned long tdata1 = SBI_DBTR_TDATA1_TYPE_MCONTROL6;
+
+	report_prefix_push("test type");
+	report_prefix_push("sbi_debug_num_triggers");
+
+	ret = sbi_debug_num_triggers(tdata1);
+	sbiret_report_error(&ret, SBI_SUCCESS, "mcontrol6");
+	*num_trig = ret.value;
+	if (ret.value > 0) {
+		report_pass("Returned mcontrol6 triggers available");
+		report_info("Returned %lu mcontrol6 triggers available",
+			    ret.value);
+		report_prefix_popn(2);
+		return tdata1;
+	}
+
+	tdata1 = SBI_DBTR_TDATA1_TYPE_MCONTROL;
+
+	ret = sbi_debug_num_triggers(tdata1);
+	sbiret_report_error(&ret, SBI_SUCCESS, "mcontrol");
+	*num_trig = ret.value;
+	if (ret.value > 0) {
+		report_pass("Returned mcontrol triggers available");
+		report_info("Returned %lu mcontrol triggers available",
+			    ret.value);
+		report_prefix_popn(2);
+		return tdata1;
+	}
+
+	report_fail("Returned 0 mcontrol(6) triggers available");
+	report_prefix_popn(2);
+
+	return SBI_DBTR_TDATA1_TYPE_NONE;
+}
+
+static struct sbiret dbtr_test_store_install_uninstall(struct sbi_dbtr_shmem_entry *shmem,
+						      enum McontrolType type)
+{
+	static unsigned long test;
+	struct sbiret ret;
+
+	report_prefix_push("store trigger");
+
+	shmem->data.tdata1 = gen_tdata1(type, VALUE_STORE, MODE_S);
+	shmem->data.tdata2 = (unsigned long)&test;
+
+	ret = sbi_debug_install_triggers(1);
+	if (!sbiret_report_error(&ret, SBI_SUCCESS, "sbi_debug_install_triggers")) {
+		report_prefix_pop();
+		return ret;
+	}
+
+	install_exception_handler(EXC_BREAKPOINT, dbtr_exception_handler);
+
+	report(do_store(&test), "triggered");
+
+	if (do_load(&test))
+		report_fail("triggered by load");
+
+	ret = sbi_debug_uninstall_triggers(0, 1);
+	sbiret_report_error(&ret, SBI_SUCCESS, "sbi_debug_uninstall_triggers");
+
+	if (do_store(&test))
+		report_fail("triggered after uninstall");
+
+	install_exception_handler(EXC_BREAKPOINT, NULL);
+	report_prefix_pop();
+
+	return ret;
+}
+
+static void dbtr_test_update(struct sbi_dbtr_shmem_entry *shmem, enum McontrolType type)
+{
+	static unsigned long test;
+	struct sbiret ret;
+	bool kfail;
+
+	report_prefix_push("update trigger");
+
+	if (!dbtr_install_trigger(shmem, NULL, gen_tdata1(type, VALUE_NONE, MODE_NONE))) {
+		report_prefix_pop();
+		return;
+	}
+
+	shmem->id.idx = 0;
+	shmem->data.tdata1 = gen_tdata1(type, VALUE_STORE, MODE_S);
+	shmem->data.tdata2 = (unsigned long)&test;
+
+	ret = sbi_debug_update_triggers(1);
+	sbiret_report_error(&ret, SBI_SUCCESS, "sbi_debug_update_triggers");
+
+	/*
+	 * Known broken update_triggers.
+	 * https://lore.kernel.org/opensbi/aDdp1UeUh7GugeHp@ghost/T/#t
+	 */
+	kfail = __sbi_get_imp_id() == SBI_IMPL_OPENSBI &&
+		__sbi_get_imp_version() < sbi_impl_opensbi_mk_version(1, 7);
+	report_kfail(kfail, do_store(&test), "triggered");
+
+	dbtr_uninstall_trigger();
+	report_prefix_pop();
+}
+
+static void dbtr_test_load(struct sbi_dbtr_shmem_entry *shmem, enum McontrolType type)
+{
+	static unsigned long test;
+
+	report_prefix_push("load trigger");
+	if (!dbtr_install_trigger(shmem, &test, gen_tdata1(type, VALUE_LOAD, MODE_S))) {
+		report_prefix_pop();
+		return;
+	}
+
+	report(do_load(&test), "triggered");
+
+	if (do_store(&test))
+		report_fail("triggered by store");
+
+	dbtr_uninstall_trigger();
+	report_prefix_pop();
+}
+
+static void dbtr_test_disable_enable(struct sbi_dbtr_shmem_entry *shmem, enum McontrolType type)
+{
+	static unsigned long test;
+	struct sbiret ret;
+
+	report_prefix_push("disable trigger");
+	if (!dbtr_install_trigger(shmem, &test, gen_tdata1(type, VALUE_STORE, MODE_S))) {
+		report_prefix_pop();
+		return;
+	}
+
+	ret = sbi_debug_disable_triggers(0, 1);
+	sbiret_report_error(&ret, SBI_SUCCESS, "sbi_debug_disable_triggers");
+
+	if (!report(!do_store(&test), "should not trigger")) {
+		dbtr_uninstall_trigger();
+		report_prefix_pop();
+		report_skip("enable trigger: no disable");
+
+		return;
+	}
+
+	report_prefix_pop();
+	report_prefix_push("enable trigger");
+
+	ret = sbi_debug_enable_triggers(0, 1);
+	sbiret_report_error(&ret, SBI_SUCCESS, "sbi_debug_enable_triggers");
+
+	report(do_store(&test), "triggered");
+
+	dbtr_uninstall_trigger();
+	report_prefix_pop();
+}
+
+static void dbtr_test_exec(struct sbi_dbtr_shmem_entry *shmem, enum McontrolType type)
+{
+	static unsigned long test;
+
+	report_prefix_push("exec trigger");
+	/* check if loads and stores trigger exec */
+	if (!dbtr_install_trigger(shmem, &test, gen_tdata1(type, VALUE_EXECUTE, MODE_S))) {
+		report_prefix_pop();
+		return;
+	}
+
+	if (do_load(&test))
+		report_fail("triggered by load");
+
+	if (do_store(&test))
+		report_fail("triggered by store");
+
+	dbtr_uninstall_trigger();
+
+	/* Check if exec works */
+	if (!dbtr_install_trigger(shmem, exec_call, gen_tdata1(type, VALUE_EXECUTE, MODE_S))) {
+		report_prefix_pop();
+		return;
+	}
+	report(do_exec(), "triggered");
+
+	dbtr_uninstall_trigger();
+	report_prefix_pop();
+}
+
+static void dbtr_test_read(struct sbi_dbtr_shmem_entry *shmem, enum McontrolType type)
+{
+	const unsigned long tstatus_expected = SBI_DBTR_TRIG_STATE_S | SBI_DBTR_TRIG_STATE_MAPPED;
+	const unsigned long tdata1 = gen_tdata1(type, VALUE_STORE, MODE_S);
+	static unsigned long test;
+	struct sbiret ret;
+
+	report_prefix_push("read trigger");
+	if (!dbtr_install_trigger(shmem, &test, tdata1)) {
+		report_prefix_pop();
+		return;
+	}
+
+	ret = sbi_debug_read_triggers(0, 1);
+	sbiret_report_error(&ret, SBI_SUCCESS, "sbi_debug_read_triggers");
+
+	if (!report(shmem->data.tdata1 == tdata1, "tdata1 expected: 0x%016lx", tdata1))
+		report_info("tdata1 found: 0x%016lx", shmem->data.tdata1);
+	if (!report(shmem->data.tdata2 == ((unsigned long)&test), "tdata2 expected: 0x%016lx",
+		    (unsigned long)&test))
+		report_info("tdata2 found: 0x%016lx", shmem->data.tdata2);
+	if (!report(shmem->data.tstate == tstatus_expected, "tstate expected: 0x%016lx", tstatus_expected))
+		report_info("tstate found: 0x%016lx", shmem->data.tstate);
+
+	dbtr_uninstall_trigger();
+	report_prefix_pop();
+}
+
+static void check_exec(unsigned long base)
+{
+	struct sbiret ret;
+
+	report(do_exec(), "exec triggered");
+
+	ret = sbi_debug_uninstall_triggers(base, 1);
+	sbiret_report_error(&ret, SBI_SUCCESS, "sbi_debug_uninstall_triggers");
+}
+
+static void dbtr_test_multiple(struct sbi_dbtr_shmem_entry *shmem, enum McontrolType type,
+			       unsigned long num_trigs)
+{
+	static unsigned long test[2];
+	struct sbiret ret;
+	bool have_three = num_trigs > 2;
+
+	if (num_trigs < 2) {
+		report_skip("test multiple");
+		return;
+	}
+
+	report_prefix_push("test multiple");
+
+	if (!dbtr_install_trigger(shmem, &test[0], gen_tdata1(type, VALUE_STORE, MODE_S))) {
+		report_prefix_pop();
+		return;
+	}
+	if (!dbtr_install_trigger(shmem, &test[1], gen_tdata1(type, VALUE_LOAD, MODE_S)))
+		goto error;
+	if (have_three &&
+	    !dbtr_install_trigger(shmem, exec_call, gen_tdata1(type, VALUE_EXECUTE, MODE_S))) {
+		ret = sbi_debug_uninstall_triggers(1, 1);
+		sbiret_report_error(&ret, SBI_SUCCESS, "sbi_debug_uninstall_triggers");
+		goto error;
+	}
+
+	report(do_store(&test[0]), "store triggered");
+
+	if (do_load(&test[0]))
+		report_fail("store triggered by load");
+
+	report(do_load(&test[1]), "load triggered");
+
+	if (do_store(&test[1]))
+		report_fail("load triggered by store");
+
+	if (have_three)
+		check_exec(2);
+
+	ret = sbi_debug_uninstall_triggers(1, 1);
+	sbiret_report_error(&ret, SBI_SUCCESS, "sbi_debug_uninstall_triggers");
+
+	if (do_load(&test[1]))
+		report_fail("load triggered after uninstall");
+
+	report(do_store(&test[0]), "store triggered");
+
+	if (!have_three &&
+	    dbtr_install_trigger(shmem, exec_call, gen_tdata1(type, VALUE_EXECUTE, MODE_S)))
+		check_exec(1);
+
+error:
+	ret = sbi_debug_uninstall_triggers(0, 1);
+	sbiret_report_error(&ret, SBI_SUCCESS, "sbi_debug_uninstall_triggers");
+
+	install_exception_handler(EXC_BREAKPOINT, NULL);
+	report_prefix_pop();
+}
+
+static void dbtr_test_multiple_types(struct sbi_dbtr_shmem_entry *shmem, unsigned long type)
+{
+	static unsigned long test;
+
+	report_prefix_push("test multiple types");
+
+	/* check if loads and stores trigger exec */
+	if (!dbtr_install_trigger(shmem, &test,
+			     gen_tdata1(type, VALUE_EXECUTE | VALUE_LOAD | VALUE_STORE, MODE_S))) {
+		report_prefix_pop();
+		return;
+	}
+
+	report(do_load(&test), "load triggered");
+
+	report(do_store(&test), "store triggered");
+
+	dbtr_uninstall_trigger();
+
+	/* Check if exec works */
+	if (!dbtr_install_trigger(shmem, exec_call,
+			     gen_tdata1(type, VALUE_EXECUTE | VALUE_LOAD | VALUE_STORE, MODE_S))) {
+		report_prefix_pop();
+		return;
+	}
+
+	report(do_exec(), "exec triggered");
+
+	dbtr_uninstall_trigger();
+	report_prefix_pop();
+}
+
+static void dbtr_test_disable_uninstall(struct sbi_dbtr_shmem_entry *shmem, enum McontrolType type)
+{
+	static unsigned long test;
+	struct sbiret ret;
+
+	report_prefix_push("disable uninstall");
+	if (!dbtr_install_trigger(shmem, &test, gen_tdata1(type, VALUE_STORE, MODE_S))) {
+		report_prefix_pop();
+		return;
+	}
+
+	ret = sbi_debug_disable_triggers(0, 1);
+	sbiret_report_error(&ret, SBI_SUCCESS, "sbi_debug_disable_triggers");
+
+	dbtr_uninstall_trigger();
+
+	if (!dbtr_install_trigger(shmem, &test, gen_tdata1(type, VALUE_STORE, MODE_S))) {
+		report_prefix_pop();
+		return;
+	}
+
+	report(do_store(&test), "triggered");
+
+	dbtr_uninstall_trigger();
+	report_prefix_pop();
+}
+
+static void dbtr_test_uninstall_enable(struct sbi_dbtr_shmem_entry *shmem, enum McontrolType type)
+{
+	static unsigned long test;
+	struct sbiret ret;
+
+	report_prefix_push("uninstall enable");
+	if (!dbtr_install_trigger(shmem, &test, gen_tdata1(type, VALUE_STORE, MODE_S))) {
+		report_prefix_pop();
+		return;
+	}
+	dbtr_uninstall_trigger();
+
+	ret = sbi_debug_enable_triggers(0, 1);
+	sbiret_report_error(&ret, SBI_SUCCESS, "sbi_debug_enable_triggers");
+
+	install_exception_handler(EXC_BREAKPOINT, dbtr_exception_handler);
+
+	report(!do_store(&test), "should not trigger");
+
+	install_exception_handler(EXC_BREAKPOINT, NULL);
+	report_prefix_pop();
+}
+
+static void dbtr_test_uninstall_update(struct sbi_dbtr_shmem_entry *shmem, enum McontrolType type)
+{
+	static unsigned long test;
+	struct sbiret ret;
+	bool kfail;
+
+	report_prefix_push("uninstall update");
+	if (!dbtr_install_trigger(shmem, NULL, gen_tdata1(type, VALUE_NONE, MODE_NONE))) {
+		report_prefix_pop();
+		return;
+	}
+
+	dbtr_uninstall_trigger();
+
+	shmem->id.idx = 0;
+	shmem->data.tdata1 = gen_tdata1(type, VALUE_STORE, MODE_S);
+	shmem->data.tdata2 = (unsigned long)&test;
+
+	/*
+	 * Known broken update_triggers.
+	 * https://lore.kernel.org/opensbi/aDdp1UeUh7GugeHp@ghost/T/#t
+	 */
+	kfail = __sbi_get_imp_id() == SBI_IMPL_OPENSBI &&
+		__sbi_get_imp_version() < sbi_impl_opensbi_mk_version(1, 7);
+	ret = sbi_debug_update_triggers(1);
+	sbiret_kfail_error(kfail, &ret, SBI_ERR_FAILURE, "sbi_debug_update_triggers");
+
+	install_exception_handler(EXC_BREAKPOINT, dbtr_exception_handler);
+
+	report(!do_store(&test), "should not trigger");
+
+	install_exception_handler(EXC_BREAKPOINT, NULL);
+	report_prefix_pop();
+}
+
+static void dbtr_test_disable_read(struct sbi_dbtr_shmem_entry *shmem, enum McontrolType type)
+{
+	const unsigned long tstatus_expected = SBI_DBTR_TRIG_STATE_S | SBI_DBTR_TRIG_STATE_MAPPED;
+	const unsigned long tdata1 = gen_tdata1(type, VALUE_STORE, MODE_NONE);
+	static unsigned long test;
+	struct sbiret ret;
+
+	report_prefix_push("disable read");
+	if (!dbtr_install_trigger(shmem, &test, gen_tdata1(type, VALUE_STORE, MODE_S))) {
+		report_prefix_pop();
+		return;
+	}
+
+	ret = sbi_debug_disable_triggers(0, 1);
+	sbiret_report_error(&ret, SBI_SUCCESS, "sbi_debug_disable_triggers");
+
+	ret = sbi_debug_read_triggers(0, 1);
+	sbiret_report_error(&ret, SBI_SUCCESS, "sbi_debug_read_triggers");
+
+	if (!report(shmem->data.tdata1 == tdata1, "tdata1 expected: 0x%016lx", tdata1))
+		report_info("tdata1 found: 0x%016lx", shmem->data.tdata1);
+	if (!report(shmem->data.tdata2 == ((unsigned long)&test), "tdata2 expected: 0x%016lx",
+		    (unsigned long)&test))
+		report_info("tdata2 found: 0x%016lx", shmem->data.tdata2);
+	if (!report(shmem->data.tstate == tstatus_expected, "tstate expected: 0x%016lx", tstatus_expected))
+		report_info("tstate found: 0x%016lx", shmem->data.tstate);
+
+	dbtr_uninstall_trigger();
+	report_prefix_pop();
+}
+
+void check_dbtr(void)
+{
+	static struct sbi_dbtr_shmem_entry shmem[RV_MAX_TRIGGERS] = {};
+	unsigned long num_trigs;
+	enum McontrolType trig_type;
+	struct sbiret ret;
+
+	report_prefix_push("dbtr");
+
+	if (!sbi_probe(SBI_EXT_DBTR)) {
+		report_skip("extension not available");
+		goto exit_test;
+	}
+
+	num_trigs = dbtr_test_num_triggers();
+	if (!num_trigs)
+		goto exit_test;
+
+	trig_type = dbtr_test_type(&num_trigs);
+	if (trig_type == SBI_DBTR_TDATA1_TYPE_NONE)
+		goto exit_test;
+
+	ret = sbi_debug_set_shmem(shmem);
+	sbiret_report_error(&ret, SBI_SUCCESS, "sbi_debug_set_shmem");
+
+	ret = dbtr_test_store_install_uninstall(&shmem[0], trig_type);
+	/* install or uninstall failed */
+	if (ret.error != SBI_SUCCESS)
+		goto exit_test;
+
+	dbtr_test_load(&shmem[0], trig_type);
+	dbtr_test_exec(&shmem[0], trig_type);
+	dbtr_test_read(&shmem[0], trig_type);
+	dbtr_test_disable_enable(&shmem[0], trig_type);
+	dbtr_test_update(&shmem[0], trig_type);
+	dbtr_test_multiple_types(&shmem[0], trig_type);
+	dbtr_test_multiple(shmem, trig_type, num_trigs);
+	dbtr_test_disable_uninstall(&shmem[0], trig_type);
+	dbtr_test_uninstall_enable(&shmem[0], trig_type);
+	dbtr_test_uninstall_update(&shmem[0], trig_type);
+	dbtr_test_disable_read(&shmem[0], trig_type);
+
+exit_test:
+	report_prefix_pop();
+}
diff --git a/riscv/sbi-tests.h b/riscv/sbi-tests.h
index d5c4ae70..c1ebf016 100644
--- a/riscv/sbi-tests.h
+++ b/riscv/sbi-tests.h
@@ -97,8 +97,10 @@ static inline bool env_enabled(const char *env)
 	return s && (*s == '1' || *s == 'y' || *s == 'Y');
 }
 
+void split_phys_addr(phys_addr_t paddr, unsigned long *hi, unsigned long *lo);
 void sbi_bad_fid(int ext);
 void check_sse(void);
+void check_dbtr(void);
 
 #endif /* __ASSEMBLER__ */
 #endif /* _RISCV_SBI_TESTS_H_ */
diff --git a/riscv/sbi.c b/riscv/sbi.c
index edb1a6be..3b8aadce 100644
--- a/riscv/sbi.c
+++ b/riscv/sbi.c
@@ -105,7 +105,7 @@ static int rand_online_cpu(prng_state *ps)
 	return cpu;
 }
 
-static void split_phys_addr(phys_addr_t paddr, unsigned long *hi, unsigned long *lo)
+void split_phys_addr(phys_addr_t paddr, unsigned long *hi, unsigned long *lo)
 {
 	*lo = (unsigned long)paddr;
 	*hi = 0;
@@ -1561,6 +1561,7 @@ int main(int argc, char **argv)
 	check_susp();
 	check_sse();
 	check_fwft();
+	check_dbtr();
 
 	return report_summary();
 }
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
