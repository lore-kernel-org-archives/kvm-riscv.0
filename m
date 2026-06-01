Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B1D2CD6E60
	for <kvm-riscv@archiver.kernel.org>; Mon,  1 Jun 2026 08:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cjot6VktsDdLmXQbx1wt6bDKethdjOl50AHLF+zpGsY=; b=YMP3+ptKXcxO8V
	GNZ1WcNHqeX0tK20S+Oz5maCyomF+aWURBhFc+vFp7b6mGE/zHcT7r+FTfO9KrVKYFDau1Ud3VjPD
	Ri+1WDzNeRJ45YPd6HzXULjx/dP9Rt+jL3s7WCBZU7fPiP0/HgkwCAGi0Y4K5UYRZUXEjQaoWHohn
	7lHcr6q6adFhRzVTEN8Vr7wSS+d7ESmAzvflocjvXG+4IBxWxBLAEIEwWn3FPc9Xgq/VV5TN4swhi
	KghimsPPfmygGASYqpezwUTfcOKxkD8PKeHYi1Fb8tnLfpBs0Dxs8orgYSq4QTQXXI5MeeXGJ/l4F
	YNEE3INv2V0oj+1NtyGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyFl-0000000AOHF-10EQ;
	Mon, 01 Jun 2026 08:44:09 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyFi-0000000AOEC-1NOw
	for kvm-riscv@lists.infradead.org;
	Mon, 01 Jun 2026 08:44:07 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-8419ab3a297so3013839b3a.2
        for <kvm-riscv@lists.infradead.org>; Mon, 01 Jun 2026 01:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780303445; x=1780908245; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RiMpL3okPlrr37XPCPDIwMU1jHFLDEyhgttQYYvX9pI=;
        b=fos+KWA1Y7H9PYnSm6OR5CpUyfOy5Zy92B4KW1TIHq58TdNwLY/WLOnnhnxoZXeWS1
         EuOq9fte6nTDLhXf6JREWYqPpoblwhuJKeKCpR79nSPVzkq7/aWpVat6dbxtw4Ecytwp
         y0/5vpJxuJ1DS2djgNa3AB8rHJ0Si6qo/5v5s5PO9j32lOoqHStW6QhVDXYckacEgIRd
         Hn1dNnOmNnRhWoYBcjUQXGzbwwaepS2bxLToximReVDTUrlaBJtuwj0mNe8x1Motx/xf
         XGUXovWYaPhvK09R1pycAt87OZQiqQMEGk2FvCotkkDu/zwZAVLD65tdu+kZL+ORzuqz
         dnxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780303445; x=1780908245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RiMpL3okPlrr37XPCPDIwMU1jHFLDEyhgttQYYvX9pI=;
        b=ET3gr3DvVvo4DudARS3byZ8PfkdEo/aUudH+wOOwtQPuCCk4WS3Y+NkD+IuYi/kLE1
         Z4nLOPxIirLvlSBL2FT8qsX6FPTMG/8E52H112Jnpu3TBKIWoQzu/oYmisklcUzjbIKZ
         V0pjBwWyWbRhizqDMBxd0tLi/l7QUmL5hpGEYMujX3I9NUkEl9ZGYe7zt89khMJPa56h
         jd5bZ8pqdK8Lc5wnO0ylIQB37T0Oi57VrdpvS3FdK6oV1EU5do2NSypn3LXjwCfS+w8l
         754RRFvYjs9mUYNUkAEhi3i5daJsRSdtZ/a3abxV5H94WC7uxgBM9rlO3E5YyeiFDmcM
         tqZg==
X-Forwarded-Encrypted: i=1; AFNElJ+HfLNGlA9+wfoAl7HyUKOtXEecNbTcBotZTq8cS5XEUI+W5AskfxgalotuQAa91dD1i0oyIXYGOic=@lists.infradead.org
X-Gm-Message-State: AOJu0YxJs3RE2S8PPTk4sJhlUOF/oCD9IrbM2F363+qrYbeo6Ys0SxZ1
	wCNfPgQtMCQWBsWG9XBo0DHF9nPDWmhPTihDbzEwKRMXbLORGFL3d2zn
X-Gm-Gg: Acq92OHg50pE8SUJplJx3NLair1tbNCiU5gwO2Tn0RnZBhh3aqot8mXFrqu3JzJ9Dy8
	hQf11bHtS+dmxp/iertW47r3Lq+dnwzELPEOs6/BdAZayrhlVH3VOErssGmPFQ4hRdVUc1OwnS6
	BptpkhxajjzhyE/RUtke0cI9JcrRGOy+z4NwrJbE7PW8SRCc4Vws8BmgFFUKQrmIeeDF5ZfDzEK
	euntpkLg8VaFGfZGdYrqvO9EA6zCEcRejrjoRjRZphVF96Sb+oJD4j4dlcaBZNYAbF0VtPtMqLB
	qZxG/rfBLKMznQQmByeZWyNvWp4JiR0re6H1NEPxoaENeW4//jW81/IWgmr+Z7/qUxepq382OKp
	cY+JX5PUdObi/fBIlfkPa2iniWfpb1HDKxy/03YyhuFPFeCNRPDx8Z0IrkLQRcLeUgP9/elcJXs
	B0Hq8z0muVSMkEmKgmpUx8Vohmhsl78o4o0w==
X-Received: by 2002:a05:6a00:3982:b0:822:6830:5900 with SMTP id d2e1a72fcca58-84225320cd2mr9410764b3a.6.1780303445292;
        Mon, 01 Jun 2026 01:44:05 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84214affe1dsm9556085b3a.1.2026.06.01.01.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 01:44:04 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Deepak Gupta <debug@rivosinc.com>,
	Thomas Huth <thuth@redhat.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Sergey Matyukevich <geomatsi@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 3/7] RISC-V: KVM: Only enable Svadu extension when Guest/VM requests
Date: Mon,  1 Jun 2026 16:43:31 +0800
Message-ID: <20260601084336.2601675-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260601084336.2601675-1-inochiama@gmail.com>
References: <20260601084336.2601675-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_014406_415675_FEF013B8 
X-CRM114-Status: UNSURE (   9.16  )
X-CRM114-Notice: Please train this message.
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

Since the Svadu extension can be controlled by the FWFT, there is
no need to enable Svadu at startup. Only enable it when it is
requested.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/kvm/vcpu_config.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_config.c b/arch/riscv/kvm/vcpu_config.c
index 238418fed2b9..b2a1028106d5 100644
--- a/arch/riscv/kvm/vcpu_config.c
+++ b/arch/riscv/kvm/vcpu_config.c
@@ -53,10 +53,6 @@ void kvm_riscv_vcpu_config_ran_once(struct kvm_vcpu *vcpu)
 	if (riscv_isa_extension_available(isa, ZICBOZ))
 		cfg->henvcfg |= ENVCFG_CBZE;
 
-	if (riscv_isa_extension_available(isa, SVADU) &&
-	    !riscv_isa_extension_available(isa, SVADE))
-		cfg->henvcfg |= ENVCFG_ADUE;
-
 	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SMSTATEEN)) {
 		cfg->hstateen0 |= SMSTATEEN0_HSENVCFG;
 		if (riscv_isa_extension_available(isa, SSAIA))
-- 
2.54.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
