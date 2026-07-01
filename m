Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EE1AC43602
	for <kvm-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 02:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9WxWQhIip1PpJZCFaesxLvDmYFj2cIKGpK3QS/g8A0Q=; b=M/8oef4z50nByR
	N+lr56GCkSRzQuta+zQ8CTsq51UUgqf/dIM/W/9eLUCtQ2BI26Jak8mpretgFp5npNCYTlGPBE+Oi
	3ZV7/TAvYfSLBoBbvqEMVP8Y7C0qgDhE6cLj3M5VBbsnL3VopGxUyJ/AwXey/YOscCFVgNjN6tYK/
	S6rcPnDuWxBFBRytbWt9atDyA+n72pvFXkS49QIOQTQrnn6wy34/QwN1dQSudC/BBZL2eJdfngr0f
	b6MachButwhm9U1SBXWMTuDGTFyADRKrLMajDEoft0GVI2uehBwaiQ5wQvjLeHojr9oPSuzMlL2eq
	LmiBEGkio3QsoyQm0Wcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wekNJ-00000000UpM-0mSq;
	Wed, 01 Jul 2026 02:08:29 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wekNB-00000000Uku-1VHd
	for kvm-riscv@lists.infradead.org;
	Wed, 01 Jul 2026 02:08:25 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-37fb434c547so89338a91.0
        for <kvm-riscv@lists.infradead.org>; Tue, 30 Jun 2026 19:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782871700; x=1783476500; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MI4l7nifRnfxUSWJkRHmALVeDUyVcPjbpLqiu+zme2g=;
        b=po4kDk/lZywXCElmrEehdpcTOcoSsUoCxOEPbUTcYiKB9ie8sNCyIId7E2tIpaXsTT
         C08SE9NVWZm4DFoKrclhOaWeL9fV+gZOjCCJ9D/GQ3Oj8XTI5xO0LW84oDyw6VgJwqRZ
         4dK922VrQboZpxJW+N9YtW5eN2BW6mKlXkjAl+rEVod+s3iWcJ+rMwT+aWbyHnZ6Dwww
         Tg3WBpw+IDmQFawuEEeaTa/1KQWhAIJoa4Oc0P3Ywp37Lk5kXRzNlVkgPOjY52vnpCyN
         tlZOEiuldEqFY3PSPalvmqTbn/9yp2NyM4gchMB2PjlHTsZJtU6J5UgsTvLPqoswhOUu
         v5JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782871700; x=1783476500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MI4l7nifRnfxUSWJkRHmALVeDUyVcPjbpLqiu+zme2g=;
        b=oHQMOWv8fDs0mGXePW5up7rU5W4hP+D47W+k5ouQ6rv/CK9ugxPaTCvZA8F7fKp8CM
         7qPqgWTg4bJFwRQ6vbXyTxA/9BAT0+ZC9sbQX6Jb+B8N7Btvf8cp0sfgXbteYXb0NkTx
         xRALR+roPaT9rJafys4Az/TpD29/7qdC+MkIpP008h7kqLsNe5xbk2aUujnID9o0bXhP
         mCCFHFTZ+KJdRxWwsv1t1JrRpaFUYX4TLGAn6LITw9TESQknGa1NDwwDU13Tsxat9UtT
         Esx5ccg6aEBo93ocRdUa8bJ087IY+MoI0PHK+vrSY4vIZKRqPzcrMrVVrTq30lSTw5R/
         ZMSg==
X-Forwarded-Encrypted: i=1; AHgh+RpWKaTSIodmgxTC+S08sjJ9qjdOsra1MinLv55OsesTTscVw9UFZ3HJSCqOByqhA++nMjHUARyHGWM=@lists.infradead.org
X-Gm-Message-State: AOJu0YzLKHP7DnaUYkJ78YEX5UP9qXJ/fLQZu7fQlGqG/lP9OxP3p5iS
	5pdpUbozNfvDKVDHTxHpXUVZav61e6OxmlpqIThOQw5ogKn1WnRUBUcZ
X-Gm-Gg: AfdE7ckCwwLN56W3pl2B824t7DwrE/Op4YbxQ9FhF8CxeUeY9lmjMh1qfHQja767m1X
	2mNao41Hdbh19CQ/xtICTjd1d24qUNKHDvT9ykSZ6Y0lgJWSYytSZCUbIGjNPhbtsoGRjY0XDjn
	KQEPsm6fTOgr+vlA85J/JAdnKiQjQndewJBxJhQeZ8784/mhQYyHQXG4ykswVKSWXTtFE/Qk8l3
	wvrMK4inEPKi2cxhQNOsULly2qBbWh0KcTPWT5as41ET9XetKaUyUhfzsBlbWOpMk3+/kUkHh2H
	tOLDMl0tStLUaiSkwWml8wvbQqtDUAcJ/PjJFO7Ua1AoIJ8qzwbhKhMO3rN9n3wilPqDWL4sbj4
	DrE9+Vr4biTjJWMHIzd6VamV93AuWowQyerQDuAb4rkqK3lZ6YXXddi2ksGoZ5Ns4OW34UZmUV6
	dN/Hha/B6dZHc=
X-Received: by 2002:a17:90b:5204:b0:37f:bfa2:1887 with SMTP id 98e67ed59e1d1-3808bd62c54mr2410952a91.8.1782871700388;
        Tue, 30 Jun 2026 19:08:20 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3809645185dsm801518a91.15.2026.06.30.19.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 19:08:19 -0700 (PDT)
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
	Sergey Matyukevich <geomatsi@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Andy Chiu <andybnac@gmail.com>,
	Deepak Gupta <debug@rivosinc.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Quan Zhou <zhouquan@iscas.ac.cn>
Subject: [PATCH v4 2/8] KVM: riscv: selftests: add Svadu FWFT extension to get-reg-list test
Date: Wed,  1 Jul 2026 10:07:39 +0800
Message-ID: <20260701020746.170157-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260701020746.170157-1-inochiama@gmail.com>
References: <20260701020746.170157-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_190822_900776_D07414D5 
X-CRM114-Status: GOOD (  10.22  )
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
2.55.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
