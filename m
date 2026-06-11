Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E72ACD8C9D
	for <kvm-riscv@archiver.kernel.org>; Thu, 11 Jun 2026 20:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hhvv+C+OWzNPWc06QfelQdzXx2hw4CZYS6tGgaf1Zr0=; b=Dfd4wvr33mNM5G
	ukjKpFJ7D13oig0F9hleYGrnTHhToffQPHp8YK3D6nB1ITe49v0vP3/xxvdJvo3uvNgUiNld/57ws
	Dh3oyU3H4cYuQcEsQdtQS3tbsCQBKEh8LmiDPQFE3IGnLqAW3H/4sr/rPdNJFv6Mo8crdetQGzjGb
	oYIZsa9KRMwfP9TYB/wEFSgsGSzHX9RE+29SdvVBTpsXN4hww+uDb9OV+bRKp9ljgwskDppfRcKZm
	Em8ClUWTzAqNREyy9I++6k/Kv2xtd+cpqygONHrgKRzr4XbnrvhKJI39x9KJ+gRNxxXYCxyuDVLrI
	m+S7ua+zbXaZZayKlNJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXlnz-0000000A1es-1OiD;
	Thu, 11 Jun 2026 20:15:11 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXlny-0000000A1da-12HP
	for kvm-riscv@bombadil.infradead.org;
	Thu, 11 Jun 2026 20:15:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=s33xvqRXSwYW5aY762y7SoN6oHtyGwi5/WijbbVgfN0=; b=ilrooAiry7AhGx1WcW/PKOKeWv
	/EdsoAmvfeAekpjJYrIWnmPhmVHrbrA7eDEArv2EunKzGA129tE0dkYVpHvh9x1v/OTUloUhcZ3sM
	iX9rUZXLWF9dRfvIe9I+JAYJun+udvdV0fP8RSU3CqOLFupIEk8Il8LknaxnuSXK3aszG0PiQ7fcG
	mS4qwECZl5Z3C+Ml+REYYM6aZzILXivSKGtvhKsXLZMXwg9Iy4zVA3lxg0bYq0WqZwrn7SvqNmYzV
	3OahyR+m762UXGk7gTZVXiUvMHVhZ4y+kiweFfaRIm20AlVkCUM2ZsIq+NL6mAZW5BeAbbDfaFpas
	c3OR+PJQ==;
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXlns-00000002WjY-3eAC
	for kvm-riscv@lists.infradead.org;
	Thu, 11 Jun 2026 20:15:09 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2bf77d4a4e2so7899315ad.1
        for <kvm-riscv@lists.infradead.org>; Thu, 11 Jun 2026 13:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781208903; x=1781813703; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s33xvqRXSwYW5aY762y7SoN6oHtyGwi5/WijbbVgfN0=;
        b=FB64M7bBGJsanMpuSnQXQNAIyVQizvMaWlCjzyFpGfSVUGfSaQoBzmxgq5qp5crC84
         AjeDoEptQ1Kt5aHLU2vg1tbCwzcSJ2IXOAwxiHRnAxilutpsqm5VW2T2VGu7cg4i/Zep
         2mNRcLfSKQPfEaT9BXWPccaDbdUwHyHdL1XgUf6vlzl2cBCfSVwdsHBoZTnjLKJoeaJc
         6UJwEullROvzwypxBRfJUbxsZcI9GUni1Q26jUxkxu0EkYWRmnlLLYIHdvB93Ox2MoHV
         oAFQYWWYATKSwf0VBtP3qyjhTJWf79b+NhaBWsS20a8DpI8UEn7Zh8mdLaKToWqLcAFE
         ebyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781208903; x=1781813703;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s33xvqRXSwYW5aY762y7SoN6oHtyGwi5/WijbbVgfN0=;
        b=ai7fRD2uW+OIQvBC/8pvMKtMfREU/KxlS9SWvsReOzqYlOEWB3odw7WbcAQMBH6/Re
         ovfwoq6X1gYnyvZl/HZI3+mSVLVfztAdcf0dG/CLmGRnIOAwIpZIqAXzYUW9NTHlBt+f
         voP7mqkYWaAAhw7baqLp+ZPUnZeVfQ9+P+BDOTWBNqk/xfTXW6SZkjvau6nhlDEsAapN
         Gq6OBIAApwm25E7XXVAK9FuMjGU8L+OGtu/J3skIvwg/BtAPWmuTbmJ3dqhiZxby/0ay
         nnU0uIcWkGrYsvEbIW3gubmvlw/WnkB+jdxkOi/pyOnstOV+vgR5XZDFG8mI7WNIMl1j
         O+uQ==
X-Forwarded-Encrypted: i=1; AFNElJ+VWDFhtz/TgSt6CfhDOnHcvdif6VODQeTy7R38m5yEcuX+J/bB4md+VUmI6ULu77iCflmvFQeru3E=@lists.infradead.org
X-Gm-Message-State: AOJu0YzhHtkl16FhISCb0pCzqOs0r2499yTl2KuvJI9zXw+OqoRkDNZd
	xhohTvXqr33v3ty1HMe3ejp45wKmPU64WxEb/d/NFVEQyVvUgvaaCnmK
X-Gm-Gg: Acq92OF/3p62XYjX1R8p8mLQX8kZ9kB3C8ojhYXleRkmkPGiA7uZvMDrbaHBjkfwaos
	5DwoLYguWnMzHqQThkb4I3ogvdnfGVYAS+nlQ3hnsmpEmEYLih3WQsVe3tia7MlErzEk5Z+SDgn
	Y7pvEdGK5loCB2SO4jy2BbGileiWtge/Pax+NgCyi5qpFpNM6qrMRsgN0W6eo6OcCr2KPyR82wp
	m+mCvf3QOQ8rfimENfPpMG8p2bxCt1JYxL+rVWHdOIH1nBfb3/wP8eccG2TGYZidSMIbtv6+3Sg
	X5u/5VdMG2mds3/vDSFugQuopsv0FAWPMH02MvAD8sSco9og7csPbOoKD7YbpnDUXSOc5Mydwvl
	KOOM1hxDCsJasgGk7UMyxAqBthZVEZp1auXfojLvx/U6tPfKj8UDzUza1wVvXxTZ8siBuCPrf3g
	==
X-Received: by 2002:a17:903:b84:b0:2bf:2d0:8877 with SMTP id d9443c01a7336-2c3fd41e1f5mr1612815ad.23.1781208902702;
        Thu, 11 Jun 2026 13:15:02 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::302d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f875casm288730475ad.22.2026.06.11.13.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 13:15:02 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Thu, 11 Jun 2026 16:12:51 -0400
Subject: [PATCH v4 14/16] riscv: cpufeature: Introduce ISA bases bitmap and
 rva23u64 detection
MIME-Version: 1.0
Message-Id: <20260611-rva23u64-hwprobe-v2-v4-14-3f01a2449488@gmail.com>
References: <20260611-rva23u64-hwprobe-v2-v4-0-3f01a2449488@gmail.com>
In-Reply-To: <20260611-rva23u64-hwprobe-v2-v4-0-3f01a2449488@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Zong Li <zong.li@sifive.com>, 
 Deepak Gupta <debug@rivosinc.com>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, 
 spacemit@lists.linux.dev, sophgo@lists.linux.dev, 
 linux-kselftest@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>, 
 Guodong Xu <docular.xu@gmail.com>, 
 Andrew Jones <andrew.jones@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=6000; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=+1K8HjOxwjdseUWVMoSCopnAlKQBo2zmzrHNNQ7s1Xo=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhixtscOzr95dJX3uK+uZfXLXn+jMKJk7SzTMIV37tC2f2
 Lf795/86ihlYRDjYpAVU2Q5fLQle+srn2jf55w/YOawMoEMYeDiFICJhNUx/Hd0vOzi//H9M8EF
 LjaN3xmirjVFPz97kL+7JG6roNiP6FWMDP+mPoqw+blKN8VgScEVjn/PanjK+ZxN3gXO295ZyqW
 8nRkA
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_211505_456360_D8043375 
X-CRM114-Status: GOOD (  14.24  )
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

Introduce a per-hart and host-wide bitmap of conformant ISA "bases"
(named profile-class sets such as IMA and RVA23U64), computed at init
time by riscv_init_isa_bases().

Register riscv_init_isa_bases() as a subsys_initcall so it executes
after core_initcall(tagged_addr_init), which probes senvcfg.PMM and
populates have_user_pmlen_*.  Without that ordering,
riscv_have_user_pmlen(7) would still return its default false and the
RVA23U64 detection path would always bail.

Consider this as the cache that subsequent consumers (hwprobe's
RVA23U64 base behavior bit, /proc/cpuinfo's "isa bases" lines, etc.)
can read without recomputing. System-wide consistency are ensured.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Signed-off-by: Guodong Xu <docular.xu@gmail.com>
---
v4:
- In riscv_set_isa_base(), reorder those __setbit(RISCV_ISA_EXT_X,m)
  lines to make them conform to the order they appear in the RVA23 1.0
  Profile.
v3:
- Add a blank line before the subsys_initcall() registration (Andrew).
- Set the local ext_mask with __set_bit() and test the mandate set with
  !bitmap_subset() (Sashiko).
- Require the Zic64b ISA extension in the RVA23U64 mask,
  instead of open-coded cache block-size check. (New, thoughts from Andrew)
v2:
- Implement riscv_init_isa_bases() that runs at system init time,
  after tagged_addr_init() populates have_user_pmlen_*.
- Split RVA23S64 placeholder into a future patch.
---
 arch/riscv/include/asm/cpufeature.h | 14 ++++++
 arch/riscv/kernel/cpufeature.c      | 90 +++++++++++++++++++++++++++++++++++++
 2 files changed, 104 insertions(+)

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
index 29dff41313e65..f398e522a71d2 100644
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
 
@@ -1322,3 +1325,90 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
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
+
+	/* IMA */
+	__set_bit(RISCV_ISA_EXT_I, ext_mask);
+	__set_bit(RISCV_ISA_EXT_M, ext_mask);
+	__set_bit(RISCV_ISA_EXT_A, ext_mask);
+
+	if (!bitmap_subset(ext_mask, isa, RISCV_ISA_EXT_MAX))
+		return;
+
+	set_bit(RISCV_ISA_BASE_IMA, bases);
+
+	/* RVA23U64 */
+
+	/* Supm with PMLEN=7 */
+	if (!riscv_have_user_pmlen(7))
+		return;
+
+	__set_bit(RISCV_ISA_EXT_F, ext_mask);
+	__set_bit(RISCV_ISA_EXT_D, ext_mask);
+	__set_bit(RISCV_ISA_EXT_C, ext_mask);
+	__set_bit(RISCV_ISA_EXT_B, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICSR, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICNTR, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZIHPM, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICCIF, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICCRSE, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICCAMOA, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICCLSM, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZA64RS, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZIHINTPAUSE, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZIC64B, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICBOM, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICBOP, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICBOZ, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZFHMIN, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZKT, ext_mask);
+	__set_bit(RISCV_ISA_EXT_V, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZVFHMIN, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZVBB, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZVKT, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZIHINTNTL, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICOND, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZIMOP, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZCMOP, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZCB, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZFA, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZAWRS, ext_mask);
+	__set_bit(RISCV_ISA_EXT_SUPM, ext_mask);
+
+	if (!bitmap_subset(ext_mask, isa, RISCV_ISA_EXT_MAX))
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
+
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
