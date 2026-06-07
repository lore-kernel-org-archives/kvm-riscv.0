Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14581CD8C88
	for <kvm-riscv@archiver.kernel.org>; Sun,  7 Jun 2026 08:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G1vocjafAtqhQAb1udteIO1icmNTME6+Yoee8Uk+EVc=; b=DKIin9bBHjH1a/
	vd4kB+KZteUJUFv2AQpTbZr57uqTj0gkbcPVB1ejA7H7Y1LOkvjitMHjXgSXgjoX8ndZzrVNJfZfJ
	c+0PtophXiWGGAkfZsJGEWEXbP7cnAzrAYdwDhTqDC0s1NCGMMR/KHiMIg6TlhfUaMJMlx4EI9ntB
	MVgEzWpuJVVIO2KEzwz2YFL0jPaZLH/eUGjucfZzRDOOJ/s7au6T0tYMwrZ4kP5ROectMvsQqV7wP
	GVlBGsDDoqPGqokJ588aaNcIu07z4NMU+U8FQkWYKHiX8x1tVGkd6D/Ex5CSWjZYApWJBqE48DNnV
	3Rjxx/GwOM2kgL1My1rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wW8bM-000000027G9-3Moh;
	Sun, 07 Jun 2026 08:11:24 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wW8bK-000000027E4-2N0j
	for kvm-riscv@lists.infradead.org;
	Sun, 07 Jun 2026 08:11:23 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2c0aa420401so24542755ad.3
        for <kvm-riscv@lists.infradead.org>; Sun, 07 Jun 2026 01:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780819882; x=1781424682; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nysJeNyvG9UILI1DFzn2wsHy9N8jdjLD2gqQX3bP48I=;
        b=LpbohtgJBURBbCedlAflz/dqhA/jhidsDvc+EEpd/BG8v24VROYYiVaI7K/LgQVp9T
         LR/21zPeu9/rbtzwzJadvDqqCGLJ6d3CQ9UmIdDh7wo+nn7P9bzGRVgpxMVXA/1KreWX
         ZlFdY4+G19YqdPnUkgPXVrW81F285YKWUrPVYVOeoE0/j699V3AFXvFLlNZw/znl5vKQ
         AS1xapdnUgu4bDzIVMtAQ59snPV4Jcd4AoXj8094HyGHl6bNQ+DWFIkEbMlSycTpgtpN
         KCFEoZxkTPHj+OC7o9CJhuTZtv2iF2sTIGT2ISsAomXdziAOxMa5ymd5hY7EHGSN1tAJ
         BrZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780819882; x=1781424682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nysJeNyvG9UILI1DFzn2wsHy9N8jdjLD2gqQX3bP48I=;
        b=Djo922AIaPZVhFemZtegt9NnFCfRUbEtkhdtRNe+ZPaoZN6jzVCzImcIbK7n6h/sGl
         7nZQqFlYuCZNpEARC5jaw7ULeHTzsJ70PyP4h0h6mmE935r25VM9gxsDXjX36uACB00o
         1HAfvNkQLvM9J0IPO/fY923WLErMj+JQs786OkEbKqgQgB3/xcVB6K9EL8dM4BJBTQuU
         3tYRvdoq5SU+T30mH69ZrCcFsWf1gjo4NKp7LwJSkupuBfP9yGceAs7L/brE7t0Cpy+B
         scYl6DgWfxcj5hPGGNrNP/Ohc23xBZCPkvJ9N4Gctz9CC+BBSu2CnidnKYWMvsJWQOd8
         9K5g==
X-Forwarded-Encrypted: i=1; AFNElJ+b6J8TxpFAIDjNdgtAEVRSunZ9U+PennrGTDof1zf8A3k6bgV2TBeZphjuqgsY44xNE+xhRtl+sgs=@lists.infradead.org
X-Gm-Message-State: AOJu0YzuDJ0rQqSIKRgCybWC35qheN6fTErha0nmvPb0c9D5/Qjh44cz
	ESQs5Ao7j0kqIFbBX5EzSuW7ltdYpxHFExDXYQbGuceKz1x1glGnAkXi
X-Gm-Gg: Acq92OEGPvUsiGUgoKSOTaCCz7ACwOGvbM3PrSVU+VdEsOoOBf6cg4JTTqsX0rEqpT0
	qDb4r6e8CtqASDUrPY5UbOqFFLSGdOaPR27UFilBpy8XGKJPYY1B+S2SpIksccymJ8mp8ysImKG
	u+6L+a+imRemh/7M/ardmfJZRf0N7uZAbZNLWcDJgy3JpsJwrXkN2mRCaiDK0kHrhuRqoTLgRp8
	ewYRvz18Mq8keWAdGJUBJIzdOrYX45xI6xSjtVtrCLhe5Tbf6ETmNj/E1xxuIM5JwgzkLEOaWKx
	gLBXAkRFbkzwIVrhgOn/gNzT266lDr3y0nBnOzlY+ytX/sTj0D4A/zCEKAIcwHfDwmexk8ZCBsT
	mgAL8xv1eLkcJ0pZR82LcAmScU+RB97UPRs0MoN34Wpv2pSQHneb1mxXXwhRew6Tr49jCYB/icA
	NPLvit/RRl46DpVbHEch4RmW03U59+NhUL3g==
X-Received: by 2002:a17:903:2987:b0:2c1:88a1:9830 with SMTP id d9443c01a7336-2c1e7e74ecamr126056945ad.17.1780819881941;
        Sun, 07 Jun 2026 01:11:21 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c24edbb49bsm15223135ad.38.2026.06.07.01.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 01:11:21 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Thomas Huth <thuth@redhat.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Sergey Matyukevich <geomatsi@gmail.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Quan Zhou <zhouquan@iscas.ac.cn>
Subject: [PATCH v3 2/8] KVM: riscv: selftests: add Svadu FWFT extension to get-reg-list test
Date: Sun,  7 Jun 2026 16:10:58 +0800
Message-ID: <20260607081105.993908-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260607081105.993908-1-inochiama@gmail.com>
References: <20260607081105.993908-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_011122_635391_C59FD563 
X-CRM114-Status: GOOD (  10.17  )
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

The KVM RISC-V allows Svadu FWFT for Guest/VM so add this extension
to get-reg-list test.

Assisted-by: YuanSheng:claude-4.7-opus
Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../selftests/kvm/riscv/get-reg-list.c        | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index cb86cb6b3635..94e33b2ee796 100644
--- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
+++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
@@ -745,6 +745,9 @@ static const char *sbi_fwft_id_to_str(__u64 reg_off)
 	case 3: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pointer_masking.enable)";
 	case 4: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pointer_masking.flags)";
 	case 5: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pointer_masking.value)";
+	case 6: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pte_ad_hw_updating.enable)";
+	case 7: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pte_ad_hw_updating.flags)";
+	case 8: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pte_ad_hw_updating.value)";
 	}
 	return strdup_printf("KVM_REG_RISCV_SBI_FWFT | %lld /* UNKNOWN */", reg_off);
 }
@@ -944,6 +947,13 @@ static __u64 sbi_fwft_pointer_masking_regs[] = {
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pointer_masking.value),
 };
 
+static __u64 sbi_fwft_pte_ad_hw_updating_regs[] = {
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_FWFT,
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pte_ad_hw_updating.enable),
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pte_ad_hw_updating.flags),
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pte_ad_hw_updating.value),
+};
+
 static __u64 zicbom_regs[] = {
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_CONFIG | KVM_REG_RISCV_CONFIG_REG(zicbom_block_size),
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICBOM,
@@ -1259,6 +1269,16 @@ static struct vcpu_reg_list config_sbi_fwft_pointer_masking = {
 	},
 };
 
+static struct vcpu_reg_list config_sbi_fwft_pte_ad_hw_updating = {
+	.sublists = {
+		SUBLIST_BASE,
+		SUBLIST_ISA(svade, SVADE),
+		SUBLIST_ISA(svadu, SVADU),
+		SUBLIST_SBI(fwft_pte_ad_hw_updating, FWFT),
+		{0},
+	},
+};
+
 struct vcpu_reg_list *vcpu_configs[] = {
 	&config_sbi_base,
 	&config_sbi_sta,
@@ -1268,6 +1288,7 @@ struct vcpu_reg_list *vcpu_configs[] = {
 	&config_sbi_mpxy,
 	&config_sbi_fwft_misaligned_deleg,
 	&config_sbi_fwft_pointer_masking,
+	&config_sbi_fwft_pte_ad_hw_updating,
 	&config_aia,
 	&config_fp_f,
 	&config_fp_d,
-- 
2.54.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
