Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04238C44501
	for <kvm-riscv@archiver.kernel.org>; Mon, 13 Jul 2026 01:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9WxWQhIip1PpJZCFaesxLvDmYFj2cIKGpK3QS/g8A0Q=; b=paFH6RCbux9XK/
	PXlYUJvuF+hnZ7OeWRk6TudiznKskbK1opSQ17XHG5mhGqLDe8xchLkKBNDy4gCvFrRNb5mAQShNF
	4Y3edPcK3Gd0iRWxCWWWdsiPpltb+dKza2ukTC9XcxYvjZS5Q4SfzwPsGZ/RPZ9clAS1pJapHrS4D
	ZIi2CDLH2jxH1CRLsO8OXWu1Gs8Zk4VPe5YuHuvkvmMjcsZWUAUkGQ0F6TB64/I6T6IjdeCIO/fyo
	U+c3xiHjQtqKnnHd2YkKFzaWYX5R9XzR7SFuf2to1IZ8LqmhiwQ8FAzNgt46nogHyrktquOiIE8vI
	f/oy/Z4i1FQ21AQsddlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj55R-00000007tXM-2vPz;
	Mon, 13 Jul 2026 01:03:57 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj55P-00000007tVe-1ZcV
	for kvm-riscv@lists.infradead.org;
	Mon, 13 Jul 2026 01:03:56 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2cc73e322dbso27486535ad.1
        for <kvm-riscv@lists.infradead.org>; Sun, 12 Jul 2026 18:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783904634; x=1784509434; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MI4l7nifRnfxUSWJkRHmALVeDUyVcPjbpLqiu+zme2g=;
        b=lFN7/Tuhw3pxTeZDEdUqQfJtF4RrHwddYoZBBTp6v16HoMI5y9Sv/b/DF3m934Yeyt
         n/t/6fK0bd0YMfzgoClZj4obDUvvUAuAMZj6rpxMI6tsWz2ACszHHJR0O8J+83Z3X13O
         4flEhoRzbS0u9KVL97mutCEdmt41UKI2C0mekar5qlEkyOQP4UPGbaXmXggn9Wp28y+K
         0vhnQMDPkbxO8iusUspHt+1GWSahxGbW4keh0Of4JQhFxmbebrJNIXVbCwelbiLlUqgn
         sdhg16RBGpbFspthweeXhdRSrtmcgrhgTLip26pWJA6fd3/k4Xgh70aB0OcIN5oBs3MC
         dqgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783904634; x=1784509434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MI4l7nifRnfxUSWJkRHmALVeDUyVcPjbpLqiu+zme2g=;
        b=qrK6VGIE1oY2NRnzXKOPTsvOyKsU4v1zj5RO9/vsPzBTqXKplnXKf+0lK1bD2nFLT+
         tQPUP4Jp0ilNmwK3cO/BnzRraE4JJ2B9JjbXtjQBVPFIOvlCVbjFaPDZBZaTeYgPyv9k
         fG8Hru3Jc+7WEdz+oHzCfz5bmIBlKmjLbjzFc36MuueU+UiHJ/BPZJiR3teX9FIaQK1p
         00hTDglM7OyHvzSGpHx4T+i1tb2POBGXmmgfnmMoovj12r6MgiRU5hB1TXwX38O4qRfD
         3aoNIRMKhvbYB487z95d2lQ5ga22txb/5j7morMzY7w3qbNg1E5gM79+E2iErDuuocdD
         mRMQ==
X-Forwarded-Encrypted: i=1; AHgh+RqxZYwx+gbTcwatJQTY/oL6dprQmoVvhq/TQFJcNQakVhgijuTJvNiMUA+bH/Q7L38vo2g4ROBJ2FM=@lists.infradead.org
X-Gm-Message-State: AOJu0YzflvW7l0eBlOzydgG/KPRSwFpWadw7cvkmwfS9ktFdZwgs7Bor
	ZdfiUmJ/OUqZJosad8EfdPO+BEQKMt37yY9wUNcd4mrOv0lghPwSj7Ef
X-Gm-Gg: AfdE7cnmNDYWoitIFTQ0F+iN/k69WTXFnsR+t4py7YDGCzfKSDQ9cti/yMD24Z3KzGC
	yAyO0bzPtLvCOoz7rfAc8ZPPfTSJaYTYxXNZvDXbo1BFiVyWkAStvcaxLjB30MKieVtdRWll5NZ
	p3jsBoMGyjVz898CzIrHd58UNyqbRDeiUhS2CF1pgsotEbTiDUCa/QP4MC72MQxDwoBj9H/i/1X
	YfEx44WcNuCLvMcfb+ZJ5fnvwtfIJtwLUdTxdIj9U2Ic4Diflkk+T6K1mB2UUsLedZcU4xX9/fH
	PN1Rp9SWbd3BbKkLaKCKTDwo8L0C5UTPXxGfajXefUTJPiz8XaJTDLfIpEVhLnw/9r/ymBQJ917
	lufiCMZRQQP5FApU9dQNb/A8aK1H+Dmnu9sgx2Ku0u6UfwJi4PUP3tRRTjH+VSwT1pp35wto48/
	4A8zoAigMjRxU=
X-Received: by 2002:a17:902:d546:b0:2c9:cf62:6f61 with SMTP id d9443c01a7336-2ce9eac212bmr74630405ad.17.1783904634295;
        Sun, 12 Jul 2026 18:03:54 -0700 (PDT)
Received: from localhost ([121.250.214.124])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bf737bsm89409935ad.19.2026.07.12.18.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 18:03:54 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Andy Chiu <andybnac@gmail.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Thomas Huth <thuth@redhat.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Sergey Matyukevich <geomatsi@gmail.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Quan Zhou <zhouquan@iscas.ac.cn>
Subject: [PATCH v6 2/8] KVM: riscv: selftests: add Svadu FWFT extension to get-reg-list test
Date: Mon, 13 Jul 2026 09:02:55 +0800
Message-ID: <20260713010302.303278-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260713010302.303278-1-inochiama@gmail.com>
References: <20260713010302.303278-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_180355_454775_E628551E 
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
2.55.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
