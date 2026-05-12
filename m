Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54B0CCD37BE
	for <kvm-riscv@archiver.kernel.org>; Mon, 11 May 2026 13:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p4Y32z0nO9Eixjq5NB5UNWh8GRIG0tJpSH7P1vPtUvs=; b=TIJUWGzVSc9/+0
	0wBjowPfCTWYFshiBZ3DhrDJB7fZ+spfNJp6Oc1ZJXgoOoRB3unl1VylMBgy+iYzZuMAH3wxUZUWC
	IRl/f/DreKhfPJp6uFxE3fTSfLcjEGGQnscVVqUIbV5U/bvyohTnmls7A1/LaJy2IrvlYEp13A9DS
	APvhjeN2Blga8+Je5d+NCg1o6WXWI01+FJFDmWisKKZ34MHW/+zRRWZhE+qzh4A3auVmaDWugcATH
	V7i93xJXldo5jW8TzN9HLpS0gjlJ6vFGUKlzrPe86oUFl8ivDiZ7lRLi7iZDlYtPhXHUoPyQVb3+H
	ivjV4THwOBxiRCC5f7Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMQp1-0000000Dm9g-0fDH;
	Mon, 11 May 2026 13:37:24 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMQoz-0000000Dm7y-0OGh
	for kvm-riscv@lists.infradead.org;
	Mon, 11 May 2026 13:37:22 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-3665a90bcd3so2653060a91.1
        for <kvm-riscv@lists.infradead.org>; Mon, 11 May 2026 06:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778506640; x=1779111440; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1X1rQwa6+aIkH1NloR/E1SkocmjVrWbvU49Eu1vnOIg=;
        b=y/P9MvZmQ841dOhT4feYJdKbiJXOeiEg22hNNUpfWTQLfRUgoRuLTm4lirvuPo8hTB
         3QOlZXP/OsOJIIREpE66kVVvyD3L/jwu4T0d/p7VCMmzcMx2c2iKYbIepJZgcssxOmyU
         RF38S1zvJ53Q8RzMgfBy/2ofjW7gFQJ12rNLTRXiLNjOXkLD8vg8NeXDE5R7J/9ckND7
         VtyVQ5Kw9PWPrPw5CEE7i7Bcp5+fE+bbL9Y87XWDyWk6FClYa7Dicg5msU0wOCqiqQyV
         1Ey60v+K3GVgg2nQgegskpXyYTdBzbjX/usTri0Se8A6R6dT+pvPaJU6jsfC14Y1XIr5
         /4sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778506640; x=1779111440;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1X1rQwa6+aIkH1NloR/E1SkocmjVrWbvU49Eu1vnOIg=;
        b=kfT3jnz/eAR6bYgPmgFznIOwQV/35NKqM0MekPgyDHArXKWos73fX06ocP8bXYJ/ZR
         KIxkwEfzSBiG0w7ee0w424dbVmZAsXks7QwGsdY85H8dbHNMdINsNdpEkkr2RbDBOvS2
         BuVZSzDpaAmp0lGtYKJtiWoPgZ/yMcI80SKgYNcZF98Kxzqgw09YI2LJhP6dzabpnbYj
         QIyeFmPfb+7yFjfSCzcR/eAn7RwdISDb5kEKtAM1oqEYg5NFB/PNoFZoEIYFt8C8EAZw
         6zQBwIeXwb7FuxxxLfEyqQhWvxJk8s6BswI+8A5OJwUm0Q2gnjhof6Yr/1hCGQlUtgyT
         7gmA==
X-Forwarded-Encrypted: i=1; AFNElJ9EMYQYieZsoqj8Gd7zoe7A7NbZTEFZ+9kKgDg3Y8+tqk3S1FQNH3Yso52qz49re5IFrmBaed6u9lc=@lists.infradead.org
X-Gm-Message-State: AOJu0YxUhLJZqCp6lzW/Z+AiJl7kXTnxJklDAkTf/7kQWJhxsAshAtKy
	4V/fmLY9MoyIuQanfDabJtWAY2Pq+0kYLyflELSPUeSjwc61aKvMbrmiODNrYbjIePQ=
X-Gm-Gg: Acq92OGciK9kKfQveYlckpufWojOAyeKGqPYF7ORdobFN2zVgSdH8fNx14q14Vwjr9k
	Wa/5wGBX3vTzuFurS3vVarWUE0sZAKHVvEEYqanPCafmaKu+riODZRDi8FjVvCEvXwhNjxSxtcP
	WYXxDAa4IjkAKJUMCTpDZuPvvHF+Q6fEK+yN0K/m1s/6MXNBcbqeeIVed2vnH243Wt+SqgkllYl
	j4MpqvM1Ab/X160RQyZQyA7JXirwEMSyq+XI8BOuO2bEP5DV9L9whVI6MEmCC214v7+zPrP9Kmc
	0+UteLLNeHR7VNb6N7G0qZf+7OlfYCIEJim2VM9cyc8i8TnVrIhU2JUHjo0PmQ2XWa/ehrYbYWa
	d9u2uEv/MXVy2ueJx91b0moFWScTtHHUzi12vZGqQL7iynM5172rQHO0d4wWF0/lbbZzgpcE7D7
	8ZgbnZffb80G8Ct8Jl3KWx4Zi7NdON2TjL61YF9MtqVl8=
X-Received: by 2002:a17:90b:38cb:b0:367:bf59:6f9f with SMTP id 98e67ed59e1d1-367d48a22damr10503248a91.25.1778506640486;
        Mon, 11 May 2026 06:37:20 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::30f3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367be3daafesm3034326a91.8.2026.05.11.06.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 06:37:20 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
Date: Mon, 11 May 2026 21:34:53 -0400
Subject: [PATCH v2 08/10] riscv: cpufeature: Introduce ISA bases bitmap and
 rva23u64 detection
MIME-Version: 1.0
Message-Id: <20260511-rva23u64-hwprobe-v2-v2-8-21c5a544f1dc@riscstar.com>
References: <20260511-rva23u64-hwprobe-v2-v2-0-21c5a544f1dc@riscstar.com>
In-Reply-To: <20260511-rva23u64-hwprobe-v2-v2-0-21c5a544f1dc@riscstar.com>
To: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Shuah Khan <shuah@kernel.org>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>, Shuah Khan <skhan@linuxfoundation.org>, 
 Deepak Gupta <debug@rivosinc.com>, Zong Li <zong.li@sifive.com>, 
 Christian Brauner <brauner@kernel.org>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>, 
 Charlie Jenkins <charlie@rivosinc.com>, 
 Samuel Holland <samuel.holland@sifive.com>, linux-doc@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_063721_162258_011132B6 
X-CRM114-Status: GOOD (  13.93  )
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

Introduce a per-hart and host-wide bitmap of conformant ISA "bases" --
named profile-class sets such as IMA and RVA23U64 -- and compute
both at init time.

This is the cache that subsequent consumers (hwprobe's
RVA23U64 base behavior bit, /proc/cpuinfo's "isa bases" lines, etc.)
read without recomputing.

riscv_init_isa_bases() iterates over all possible cpus to populate
each hart_isa[cpu].isa_bases, then computes the host-wide
riscv_isa_bases against the AND-across-harts riscv_isa bitmap.  It is
registered as a subsys_initcall so it executes after
core_initcall(tagged_addr_init), which probes senvcfg.PMM and
populates have_user_pmlen_*.  Without that ordering,
riscv_have_user_pmlen(7) would still return its default false and the
RVA23U64 detection path would always bail.

The detection itself is encapsulated in riscv_set_isa_bases(), which
takes an output bases bitmap and an input ISA bitmap.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v2:
- Implement riscv_init_isa_bases() that runs at system init time,
  after tagged_addr_init() populates have_user_pmlen_*.
- Split RVA23S64 placeholder into a future patch.
---
 arch/riscv/include/asm/cpufeature.h | 14 ++++++
 arch/riscv/kernel/cpufeature.c      | 92 +++++++++++++++++++++++++++++++++++++
 2 files changed, 106 insertions(+)

diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index 739fcc84bf7b2..facc31b2960c6 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -25,10 +25,24 @@ struct riscv_cpuinfo {
 	unsigned long mimpid;
 };
 
+enum {
+	RISCV_ISA_BASE_IMA,
+	RISCV_ISA_BASE_RVA23U64,
+	RISCV_NR_ISA_BASES,
+};
+
+/**
+ * struct riscv_isainfo - per-hart ISA state
+ * @isa: bitmap of ISA extensions this hart implements
+ * @isa_bases: bitmap of profile bases this hart conforms to
+ */
 struct riscv_isainfo {
 	DECLARE_BITMAP(isa, RISCV_ISA_EXT_MAX);
+	DECLARE_BITMAP(isa_bases, RISCV_NR_ISA_BASES);
 };
 
+extern unsigned long riscv_isa_bases[BITS_TO_LONGS(RISCV_NR_ISA_BASES)];
+
 DECLARE_PER_CPU(struct riscv_cpuinfo, riscv_cpuinfo);
 
 extern const struct seq_operations cpuinfo_op;
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 81145621dc378..6e8dd33aa3888 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -41,6 +41,9 @@ unsigned long elf_hwcap __read_mostly;
 /* Host ISA bitmap */
 static DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __read_mostly;
 
+/* Host ISA bases bitmap */
+DECLARE_BITMAP(riscv_isa_bases, RISCV_NR_ISA_BASES) __read_mostly;
+
 /* Per-cpu ISA extensions. */
 struct riscv_isainfo hart_isa[NR_CPUS];
 
@@ -1305,3 +1308,92 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
 	}
 }
 #endif
+
+/*
+ * Compute the set of profile bases (IMA, RVA23U64, ...) a hart
+ * conforms to, given its resolved ISA bitmap.
+ *
+ * If @isa_bitmap is NULL, the host ISA bitmap (the AND across all harts) is
+ * used.
+ */
+static void riscv_set_isa_bases(unsigned long *bases, const unsigned long *isa_bitmap)
+{
+	const unsigned long *isa = isa_bitmap ? isa_bitmap : riscv_isa;
+	DECLARE_BITMAP(ext_mask, RISCV_ISA_EXT_MAX) = { 0 };
+	DECLARE_BITMAP(tmp, RISCV_ISA_EXT_MAX);
+
+	/* IMA */
+	set_bit(RISCV_ISA_EXT_I, ext_mask);
+	set_bit(RISCV_ISA_EXT_M, ext_mask);
+	set_bit(RISCV_ISA_EXT_A, ext_mask);
+
+	if (bitmap_andnot(tmp, ext_mask, isa, RISCV_ISA_EXT_MAX))
+		return;
+
+	set_bit(RISCV_ISA_BASE_IMA, bases);
+
+	/* RVA23U64 */
+
+	/* Zic64b and Supm with PMLEN=7 */
+	if (riscv_cbom_block_size != 64 ||
+	    riscv_cbop_block_size != 64 ||
+	    riscv_cboz_block_size != 64 ||
+	    !riscv_have_user_pmlen(7))
+		return;
+
+	set_bit(RISCV_ISA_EXT_F, ext_mask);
+	set_bit(RISCV_ISA_EXT_D, ext_mask);
+	set_bit(RISCV_ISA_EXT_C, ext_mask);
+	set_bit(RISCV_ISA_EXT_B, ext_mask);
+	set_bit(RISCV_ISA_EXT_ZICSR, ext_mask);
+	set_bit(RISCV_ISA_EXT_ZICNTR, ext_mask);
+	set_bit(RISCV_ISA_EXT_ZIHPM, ext_mask);
+	set_bit(RISCV_ISA_EXT_ZICCIF, ext_mask);
+	set_bit(RISCV_ISA_EXT_ZICCRSE, ext_mask);
+	set_bit(RISCV_ISA_EXT_ZICCAMOA, ext_mask);
+	set_bit(RISCV_ISA_EXT_ZICCLSM, ext_mask);
+	set_bit(RISCV_ISA_EXT_ZA64RS, ext_mask);
+	set_bit(RISCV_ISA_EXT_ZIHINTPAUSE, ext_mask);
+	set_bit(RISCV_ISA_EXT_ZICBOM, ext_mask);
+	set_bit(RISCV_ISA_EXT_ZICBOP, ext_mask);
+	set_bit(RISCV_ISA_EXT_ZICBOZ, ext_mask);
+	set_bit(RISCV_ISA_EXT_ZFHMIN, ext_mask);
+	set_bit(RISCV_ISA_EXT_ZKT, ext_mask);
+	set_bit(RISCV_ISA_EXT_V, ext_mask);
+	set_bit(RISCV_ISA_EXT_ZVFHMIN, ext_mask);
+	set_bit(RISCV_ISA_EXT_ZVBB, ext_mask);
+	set_bit(RISCV_ISA_EXT_ZVKT, ext_mask);
+	set_bit(RISCV_ISA_EXT_ZIHINTNTL, ext_mask);
+	set_bit(RISCV_ISA_EXT_ZICOND, ext_mask);
+	set_bit(RISCV_ISA_EXT_ZIMOP, ext_mask);
+	set_bit(RISCV_ISA_EXT_ZCMOP, ext_mask);
+	set_bit(RISCV_ISA_EXT_ZCB, ext_mask);
+	set_bit(RISCV_ISA_EXT_ZFA, ext_mask);
+	set_bit(RISCV_ISA_EXT_ZAWRS, ext_mask);
+	set_bit(RISCV_ISA_EXT_SUPM, ext_mask);
+
+	if (bitmap_andnot(tmp, ext_mask, isa, RISCV_ISA_EXT_MAX))
+		return;
+
+	set_bit(RISCV_ISA_BASE_RVA23U64, bases);
+}
+
+/*
+ * Populate the host ISA bases bitmap (riscv_isa_bases) and each
+ * hart's per-cpu isa_bases.
+ */
+static int __init riscv_init_isa_bases(void)
+{
+	int cpu;
+
+	for_each_possible_cpu(cpu)
+		riscv_set_isa_bases(hart_isa[cpu].isa_bases, hart_isa[cpu].isa);
+
+	riscv_set_isa_bases(riscv_isa_bases, NULL);
+	return 0;
+}
+/*
+ * Registered as subsys_initcall so it runs after
+ * core_initcall(tagged_addr_init) populates have_user_pmlen_*.
+ */
+subsys_initcall(riscv_init_isa_bases);

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
