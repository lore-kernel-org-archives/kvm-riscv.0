Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26D36ECD9B5
	for <kvm-riscv@archiver.kernel.org>; Fri,  6 Feb 2026 00:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YrHPV3gMegbAgKIKO8Tc/762z9feIaDAJSDPEFbAgko=; b=RpSr3VSwUQTGx0
	5FfGdhCjM08wzdBxrgR9Qt48o3HNZGRFEEQKDcJKdP1qbuMXeCRbu9rhAJ7Eabmt0pTGYfA0WKycZ
	FHkPF0iuzqdi+xTmlimqHozvRF5SoDQjKHa3m+bWezTm4DxUMjMIr5auXTeAIff/lDRr51wDzxys6
	9TWt7HAAWktMDNMfyuIIv1JEQCa6a2320f6JS6pHSsdCHCIY3V6ROhp/LB31ApXnLpmjxRJRexOIU
	RL6vjGeIGA5aNc8LrtmIN6CPcAJ8soHuJwJlLWqwwyCI8cWmBjVG0yk3ZkjcwV781tkGQ/cDSPgJm
	iDWVy9IUx/2xFr1oKDZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo9dx-0000000AeIP-2cPd;
	Fri, 06 Feb 2026 00:24:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo9ds-0000000Ae9E-2jzF
	for kvm-riscv@lists.infradead.org;
	Fri, 06 Feb 2026 00:24:15 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 615IEUMO571646
	for <kvm-riscv@lists.infradead.org>; Fri, 6 Feb 2026 00:24:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=P8QpParZv1w
	+CDvvSy5R0lqzNjzdUp8ROHjISVSX81c=; b=jNXb8H1x4NzKu7EsK7MU1kx3NmQ
	ZfmKekFcKzv/VZ6eD58hfy3HQG+FZcLtgq4D9QYHgM0M3ZvvXaEucr5ixseIKkXw
	OS0FdeVtmJgQgTlSufhXCeG0CJFA/PE4PdLhbaCpQuVZLGpqU3fLbNz0qIcVhu1h
	KOb2EZmsD1nEAiDVDCQ3vjyyD+ZgPOzOW/gjK1N32JcbeEyvQa1j4OqSNqQPguIJ
	E9FQbsbNq24pGTuiIeMBhEZkL/9frzgfHndNaxVCBrSOy9WNneEaNMUAQ95c8yZl
	M/oNO7NK8F6IM0gGR4vvHpoeIT2ZIYF7MjD4Hzv0tveJx2IVn9S4/e5kDaA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c50a992mt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Fri, 06 Feb 2026 00:24:11 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2b82974bd26so148725eec.1
        for <kvm-riscv@lists.infradead.org>; Thu, 05 Feb 2026 16:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770337450; x=1770942250; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P8QpParZv1w+CDvvSy5R0lqzNjzdUp8ROHjISVSX81c=;
        b=YFF9Bl1Cz6o6Fh4NGSlVpso/RLZKK3k5OdZZaBV6437ORb2U+Qj17NFwu2ZVp5GoPw
         YpvwRaOZBOAAiF4UIH58fbY1Ij3LXEhOLt9L/D1JWuS8KSKPq6waRejaA4GHxxnJ74f3
         Scmh3v4pXgOkHNJ2SnVgWCpLDCRDLGvx57euk3Lr/dPPIe1kj+vpSknYXQqDtu+RGnVN
         bXGU1JlEhIt4SjlqPe4m3f4lsPVsjaGr5BubHFiMUdsoagaJe0kIfho9f9xbZwLvSa5M
         xYdrIZfaOKpWX5AXIPOUP2A4WwRDnZzSrw2syarfOSHPd/ZlHyQg9w2nTwTWYUvQTArE
         g11Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770337450; x=1770942250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P8QpParZv1w+CDvvSy5R0lqzNjzdUp8ROHjISVSX81c=;
        b=ExITPjUv3s0gSEN0k9PnAvP2q8zv05tTuWDzf2PUD2RE40Ts0ILuazw500MDlBe5OU
         1F3KelxkxU50eoosAWnYy8Y+hxUeqZHWXUlm8HbwZkX4+EGg4m/SIIG5ibZ0NVxjATl+
         4t6N0nWfW9281DCid4luwWpsSIMbdIILIlsqu2voBef32Rdln6qXFTsHyUEHbPu1s+pO
         +krbKWuDc33vVlaix7dM5MuOEpMVcq4dfSkwauXJbdMYH4TPyg99co0eJjq0LV8+TrRX
         WPihZ0rY3F5hd/Z45TSWJkap6FUuTZDRih4EhgCn9I5IJVU+QeLqzfFfOjFRk0sAUdZI
         JEyA==
X-Forwarded-Encrypted: i=1; AJvYcCVJFN4Z9YDHdvnxMWGiVyTFzt3HQNus+p0JrUceIn2g2zttlCmNBnetQQegjKdEOxZ2L7fvFqR0Wag=@lists.infradead.org
X-Gm-Message-State: AOJu0YxHAwak7YlY1IWYE/aihPo9zQX1Q8BHoZ4ZBShmiwk7cJSXvPLu
	b5JANujvCQuycg7kTh9CDQZ2ATDU1eTP8BLJpaF+gq+oJTD3xKPyZkzrLYLlAiIRq28+8+oaJK6
	AuTgmQB+UZ7QdHhCEy7bI+mTPEbtidOKMfWevjv36mnSvGBgha1Azv7k3A3sfOMvUynUt9OQWZY
	nG
X-Gm-Gg: AZuq6aKYe2og8WsrP+sEdgzn+kBK5PDlijecA58WzBjcfG5ZkB8fB2anigYAy5L6zB8
	NrkAChzfGW78qFddfWZNEei3dL5K4zhLSTf5+aUPyo5FmIJ6NX97bs8+3n4xerVYyMBam7DFO+C
	AKWccspMtKvWt0lRWo6TgBtWDVBU2x3Gr7pI3tzH5/8WDVg3kordJZVEEF74x37PsXIKGj2CaPf
	pcXCmtodAkian5vZMorXhwUBm9wdNkBWVLeuDseK5GhQtCxBB01Zo1uW3nvZ7myh8ZmID3XyN1l
	EQwyRl8U/OBq3n9BJsjwpw1vZWZLOVbP6CUPxrb9kwGa7NnuPNSXQZC7sXndGN9MSOcfe+8JIlu
	c/fkX5E29/ZkE6stnki8=
X-Received: by 2002:a05:7022:418a:b0:11b:d6f2:a6d6 with SMTP id a92af1059eb24-1270400c96cmr524447c88.34.1770337450411;
        Thu, 05 Feb 2026 16:24:10 -0800 (PST)
X-Received: by 2002:a05:7022:418a:b0:11b:d6f2:a6d6 with SMTP id a92af1059eb24-1270400c96cmr524432c88.34.1770337449872;
        Thu, 05 Feb 2026 16:24:09 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1270434760fsm743511c88.16.2026.02.05.16.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 16:24:09 -0800 (PST)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        kvm-riscv@lists.infradead.org
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Anup Patel <anup@brainfault.org>,
        =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Guodong Xu <guodong@riscstar.com>,
        Charlie Jenkins <charlie@rivosinc.com>,
        Charlie Jenkins <thecharlesjenkins@gmail.com>,
        Samuel Holland <samuel.holland@sifive.com>
Subject: [RFC PATCH v1 10/11] riscv: /proc/cpuinfo: Add rva23 bases to output
Date: Thu,  5 Feb 2026 18:23:48 -0600
Message-ID: <20260206002349.96740-11-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260206002349.96740-1-andrew.jones@oss.qualcomm.com>
References: <20260206002349.96740-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-GUID: ItgLv2PG9GcBsMdxR-GrzYSP43siFAdy
X-Proofpoint-ORIG-GUID: ItgLv2PG9GcBsMdxR-GrzYSP43siFAdy
X-Authority-Analysis: v=2.4 cv=e6ALiKp/ c=1 sm=1 tr=0 ts=698534ab cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=Noaj5xvt71MHO7PBPx4A:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDAwMSBTYWx0ZWRfX6AYVDVLA52H7
 SyhMsZxTf+0tLNJ81bse7n3+5pGsmfy6BPVSdOQU5Y3HwDRh5UPL+VntNhPaDfkSKMCjeD5SDaA
 DtTO4vQvZGkH6gkRoXJSdklJvb0btD68+gR6ftDk0F/4w+kCbfB4leJchfnijXq/qLMx5DvlrNW
 cmlIk8BSxSZCPXg0AvS8su/SG9MLXCXC5EGEUsUSjpwq+Xh6mlVCqTa9tda2f10bv1ATRN/MCFv
 E68x2mpeeuVXmbTmFT1p+Aya2utzW1oHFCg56Pzsicm7HGTVpaiNIJHVywSu5ftjsTull0UYcFp
 TcCH5+vvhhhiRV2MXk9SEuCSk9EriHrJaHnGYeUq3jE4Uyo8c2klSk1pp8cjouXYVZnvCPG591/
 OkFWDtNM0sU92LudXmiY7KfjSGzx8mOec9huMAXU4F42tlb3NCyvHeelJ3w4NnsCGUaHNKxgu/W
 cLQ4Xtv7f+HGYofS3Vg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_06,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 suspectscore=0 phishscore=0 malwarescore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602060001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_162412_850945_B2996C98 
X-CRM114-Status: GOOD (  18.61  )
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

Output the rva23(u|s)64 ISA bases that the ISA extensions provide on
new 'isa bases' lines both for the LCD of all harts and per hart, as
shown in the example output below when booting qemu with
-cpu rva23s64,sv39=on,pmp=on:

processor       : 0
hart            : 4
isa bases       : rv64ima rva23u64
isa             : rv64imafdcbvh_zicbom_zicbop_zicboz_ziccamoa_ziccif_zicclsm_ziccrse_zicntr_zicond_zicsr_zifencei_zihintntl_zihintpause_zihpm_zimop_za64rs_zaamo_zalrsc_zawrs_zfa_zfhmin_zca_zcb_zcd_zcmop_zba_zbb_zbs_zkt_zvbb_zve32f_zve32x_zve64d_zve64f_zve64x_zvfhmin_zvkb_zvkt_smaia_smnpm_smstateen_ssaia_sscofpmf_ssnpm_sstc_svade_svinval_svnapot_svpbmt
mmu             : sv39
mvendorid       : 0x0
marchid         : 0x0
mimpid          : 0x0
hart isa bases  : rv64ima rva23u64
hart isa        : rv64imafdcbvh_zicbom_zicbop_zicboz_ziccamoa_ziccif_zicclsm_ziccrse_zicntr_zicond_zicsr_zifencei_zihintntl_zihintpause_zihpm_zimop_za64rs_zaamo_zalrsc_zawrs_zfa_zfhmin_zca_zcb_zcd_zcmop_zba_zbb_zbs_zkt_zvbb_zve32f_zve32x_zve64d_zve64f_zve64x_zvfhmin_zvkb_zvkt_smaia_smnpm_smstateen_ssaia_sscofpmf_ssnpm_sstc_svade_svinval_svnapot_svpbmt

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 arch/riscv/include/asm/cpufeature.h | 10 ++++
 arch/riscv/kernel/cpu.c             | 34 ++++++++++++
 arch/riscv/kernel/cpufeature.c      | 83 +++++++++++++++++++++++++++++
 3 files changed, 127 insertions(+)

diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index 62837fa981e8..e750735c5686 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -25,7 +25,15 @@ struct riscv_cpuinfo {
 	unsigned long mimpid;
 };
 
+enum {
+	RISCV_ISA_BASE_IMA,
+	RISCV_ISA_BASE_RVA23U64,
+	RISCV_ISA_BASE_RVA23S64,
+	RISCV_NR_ISA_BASES,
+};
+
 struct riscv_isainfo {
+	DECLARE_BITMAP(isa_bases, RISCV_NR_ISA_BASES);
 	DECLARE_BITMAP(isa, RISCV_ISA_EXT_MAX);
 };
 
@@ -152,4 +160,6 @@ static __always_inline bool riscv_cpu_has_extension_unlikely(int cpu, const unsi
 	return __riscv_isa_extension_available(hart_isa[cpu].isa, ext);
 }
 
+void riscv_set_isa_bases(unsigned long *isa_bases, const unsigned long *isa_bitmap);
+
 #endif
diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 3dbc8cc557dd..228867d7dc00 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -305,6 +305,34 @@ static void print_mmu(struct seq_file *f)
 	seq_printf(f, "mmu\t\t: %s\n", sv_type);
 }
 
+static DECLARE_BITMAP(riscv_isa_bases, RISCV_NR_ISA_BASES);
+
+static const char * const riscv_isa_base_names[] = {
+#ifdef CONFIG_32BIT
+	[RISCV_ISA_BASE_IMA] = "rv32ima",
+#else
+	[RISCV_ISA_BASE_IMA] = "rv64ima",
+#endif
+	[RISCV_ISA_BASE_RVA23U64] = "rva23u64",
+	[RISCV_ISA_BASE_RVA23S64] = "rva23s64",
+};
+
+static void print_isa_bases(struct seq_file *m,
+			    const unsigned long *isa_bases,
+			    const unsigned long *isa)
+{
+	unsigned int i;
+
+	if (bitmap_empty(isa_bases, RISCV_NR_ISA_BASES))
+		riscv_set_isa_bases((unsigned long *)isa_bases, isa);
+
+	for (i = 0; i < RISCV_NR_ISA_BASES; i++) {
+		if (test_bit(i, isa_bases))
+			seq_printf(m, " %s", riscv_isa_base_names[i]);
+	}
+	seq_puts(m, "\n");
+}
+
 static void *c_start(struct seq_file *m, loff_t *pos)
 {
 	if (*pos == nr_cpu_ids)
@@ -336,6 +364,9 @@ static int c_show(struct seq_file *m, void *v)
 	seq_printf(m, "processor\t: %lu\n", cpu_id);
 	seq_printf(m, "hart\t\t: %lu\n", cpuid_to_hartid_map(cpu_id));
 
+	seq_puts(m, "isa bases\t:");
+	print_isa_bases(m, riscv_isa_bases, NULL);
+
 	/*
 	 * For historical raisins, the isa: line is limited to the lowest common
 	 * denominator of extensions supported across all harts. A true list of
@@ -360,6 +391,9 @@ static int c_show(struct seq_file *m, void *v)
 	seq_printf(m, "marchid\t\t: 0x%lx\n", ci->marchid);
 	seq_printf(m, "mimpid\t\t: 0x%lx\n", ci->mimpid);
 
+	seq_puts(m, "hart isa bases\t:");
+	print_isa_bases(m, hart_isa[cpu_id].isa_bases, hart_isa[cpu_id].isa);
+
 	/*
 	 * Print the ISA extensions specific to this hart, which may show
 	 * additional extensions not present across all harts.
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index b001e78eecf6..07a42545e9e0 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -1262,3 +1262,86 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
 	}
 }
 #endif
+
+extern bool riscv_have_user_pmlen_7;
+
+void riscv_set_isa_bases(unsigned long *bases, const unsigned long *isa_bitmap)
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
+	    !riscv_have_user_pmlen_7)
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
+
+	/* RVA23S64 */
+	set_bit(RISCV_ISA_EXT_ZIFENCEI, ext_mask);
+	/* TODO: Ss1p13 */
+	/* Svbare, Sv39 -- assumed */
+	set_bit(RISCV_ISA_EXT_SVADE, ext_mask);
+	/* TODO: Ssccptr, Sstvecd, Sstvala, Sscounterenw */
+	set_bit(RISCV_ISA_EXT_SVPBMT, ext_mask);
+	set_bit(RISCV_ISA_EXT_SVINVAL, ext_mask);
+	set_bit(RISCV_ISA_EXT_SVNAPOT, ext_mask);
+	set_bit(RISCV_ISA_EXT_SSTC, ext_mask);
+	set_bit(RISCV_ISA_EXT_SSCOFPMF, ext_mask);
+	set_bit(RISCV_ISA_EXT_SSNPM, ext_mask);
+	/* TODO: Ssu64xl */
+	/* TODO: Sha = Ssstateen, Shcounterenw, Shvstvala, Shtvala, Shvstvecd, Shvsatpa, Shgatpa */
+	set_bit(RISCV_ISA_EXT_H, ext_mask);
+
+	if (/*TODO*/ false && !bitmap_andnot(tmp, ext_mask, isa, RISCV_ISA_EXT_MAX))
+		set_bit(RISCV_ISA_BASE_RVA23S64, bases);
+}
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
