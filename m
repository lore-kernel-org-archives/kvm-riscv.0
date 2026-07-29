Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FE09C54FCD
	for <kvm-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 23:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WyQBm9TYLVs7QXTktLJ3/HwowHUXpYF07+tHJK3Eb1g=; b=T3mVa4J8fTeGQc
	LbviyBypCqOMUm2pqMEzcgq0+DyrbQaFOOabaaYChnpz+rTOJ63Pv2Iql49eILW0hs66r9kK3wzSp
	MSJu7zYXRcOaXArmHMVOs3Ncl6o965OsWbrlvVQONjb+hixuwa+DbTMfyLZfujRva6PLW1paSuvX8
	dTHimAgy+jhaM3sXdI2PfAOlWAK8mFejXxapHxtGndtUy81BJwQjWQT7dWroRuHu9447qWrsmEioZ
	g2I0wSR6D64bx0LoLvSJ7qr4OXNVR/YjXgIcNRvRbKkRZrtpIAORD46S9Bh+F2zCeRkSMgQfqBaiF
	nnoIky+Rxi4betdQyJYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpDeg-000000096v7-2rkR;
	Wed, 29 Jul 2026 23:25:42 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpDee-000000096tt-1vy7
	for kvm-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 23:25:41 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-84a2dcede83so2029277b3a.3
        for <kvm-riscv@lists.infradead.org>; Wed, 29 Jul 2026 16:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785367539; x=1785972339; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=agAohdyMJ39twgA5Lt/CMvRouMD+rLJEs3qNM/Tk904=;
        b=LoA/XNZeIow8Diigr0iEewTtCFMdjOdzWqJoFvlFK2tgOc4QqbDvb0ZeMyMNO+pguO
         +wu2l14v/6HBaQutINghgtBJKFO3IaQD8TfqckM0WFF6DHl/K8azR3KmcH1pLcqhXiRH
         3XZdgsf5TEVGREV6qMzoKuXlV9o1y9iVC6SxYBkgzEA7ztaroXG2VsWitQ9+Loh2aWBH
         fjapGqhX+W1F28uPO5zA5NUYmA72xrjGRmgez1Zgg5dBM6h7pejVeRNviAwNtRTGh8Gx
         PsZhcdLW8+gFajQ1CvhPG/009IVni1fmhd14kNBr/c01+tGOpRpcS+lpf1Qzixt6c2ij
         ytEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785367539; x=1785972339;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=agAohdyMJ39twgA5Lt/CMvRouMD+rLJEs3qNM/Tk904=;
        b=SmvZioPYsi4qXASYpkTeYQGIXRy8IfdCR+N9r0imeiu2IrSkWpUrUeBv5NAxf7GQZn
         R7jS8w/HII+PZ52IFGngNqD2ecYi7f5P9xb21WI2RFBiI7vBSPXZXQ6kjRLW+tWnjqCI
         fvSVK++/Wh4SjvKY6R4J5XfLzRiYtq1dUDeAKj5jzCAtD5Hg7+YW+MNQNTpynPXVwTc2
         0q72gcsSRg35Sw8enQxKBo57MJzxLX2VPNhXDH59hiMnrkivlPtU2Vw/tdicDo0P29Xb
         4Fh/o/P2UamlfvcEuNKHT/3YqZfLuIKwBN52NgJ4keL1u5nLmGhE5IG/LLJ4ZBQSMiZh
         3nOQ==
X-Forwarded-Encrypted: i=1; AHgh+RpQeEVwlnR0YXX5F4Ixh6F4eFCeA9exdCmhqJQi+oIUnsDRQVGFQM3QcvSDXQ2BygKV/rOwBpALNFo=@lists.infradead.org
X-Gm-Message-State: AOJu0YzW+reEfJByvH7DvV2hJ2dFzK6zHhnC9Q1sCYNmWpBcHXfX72hj
	Nu6+TRBFh6JCkn9QincwXlr4yxbrMmFRkQcyiioHbhcyfvesGpBZWjNz
X-Gm-Gg: AR+sD137ugmxt2hkUQBfi6b3y2toA5SMl1J9rimGmSBfACtX9wvQTqZYqMBNsEbao0z
	gWEYqo500Anr7dDLHHbhoNdQbrcnB3AUTj4gLOumyodE5JhSiYE3mk7FNK6bpXsfny3kVQGWGUZ
	VqqomCmdj2DTI9tl7vDi/atEo8E0VfHEz2hT8cAdHUtBDjTS0GvKesGsVcfMBjPE49/hgSVvsCm
	xpHCY8sqxwUxoctsmDdmiV+Dmie+yXKmDV/mxin8qYXY4T4g+JT2JkehwzwmvAczYTRT6vgdJ/3
	7JCIRTpxuZUknvrJNCQ7tyETADoaioKk7un0JC9MyQiQNOnIVc/5NwONYZZLXBWzvM/dKuANZ0G
	XzYph31MvO3PFAIGya9DAVp0ehbcNKy9AmdSJvcetB4nrIy0sHtFDsj4XjeIeSUTR5815CxzetC
	y6PAkYGv+y1BnM1V5zVEFpE/J3bbD3215s2wRdCW1v/+xzn39x9/eJJ/OYQpI=
X-Received: by 2002:a05:6a00:4b15:b0:845:e08c:a4eb with SMTP id d2e1a72fcca58-84ebc466aa7mr336322b3a.58.1785367539615;
        Wed, 29 Jul 2026 16:25:39 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea03ccc92sm2028551b3a.58.2026.07.29.16.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 16:25:39 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v3 0/4] RISC-V: KVM: Cleanup SBI extension status when disable
Date: Thu, 30 Jul 2026 07:25:21 +0800
Message-ID: <20260729232527.139183-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_162540_512234_49BF379E 
X-CRM114-Status: UNSURE (   8.21  )
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

KVM SBI FWFT extension has multiple internal state can be programmed
by the userspace. However, when the FWFT feature or the FWFT extension
is disabled, the internal state will be kept as it is, which may cause
some side effect for the vCPU, cleanup these state when a SBI extension
or FWFT feature is disabled.

Change from v2:
- https://lore.kernel.org/kvm/20260706021154.210289-1-inochiama@gmail.com
patch 1, 2:
1. Apply Anup's tag.
patch 3:
1. Remove the csr_dirty set.
patch 4:
1. Add a new patch that sets the csr_dirty for FWFT extension.

Change from v1:
- https://lore.kernel.org/kvm/20260701094731.1022163-1-inochiama@gmail.com
patch 2:
1. Check support callback existed before using it.

Inochi Amaoto (4):
  RISC-V: KVM: Add SBI extension validate callback
  RISC-V: KVM: Add SBI FWFT validation support
  RISC-V: KVM: Reset the SBI extension when disable it
  RISC-V: KVM: Mark the reset callback of FWFT extension always dirties
    CSR

 arch/riscv/include/asm/kvm_vcpu_sbi.h |  4 ++++
 arch/riscv/kvm/vcpu_config.c          |  2 ++
 arch/riscv/kvm/vcpu_sbi.c             | 30 +++++++++++++++++++++++++++
 arch/riscv/kvm/vcpu_sbi_fwft.c        | 27 ++++++++++++++++++++++++
 4 files changed, 63 insertions(+)

--
2.55.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
