Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84EADC44501
	for <kvm-riscv@archiver.kernel.org>; Mon, 13 Jul 2026 01:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fmmvRUE6gi+35DV1HjmrdvSkFgzplHQ56zCgIbtGR4g=; b=z/+j09QCrZpHPt
	miN3BuB6r+3K1pSe3zJtPsSzjgIjCBp1AVg/hI5J/P6OPMd1PLviVKMdaheSE6Y+E6Fp+67PYuE0y
	l2YL2hLUOIBFPD4dCVZRmrebl2nRM0Vo2Vztec9bdUzkR9hFuge5RN9qFm0qbX3KPFF+21TPVqTjc
	cvJ5/eHEAzYWid/yYvoPWPkVr12Mv/ajU/uEnT4BQa4FJdrsKrjfTd17MmSmZtk3xwJMDXEJaCtS5
	IT+pIdY1sIb/DEMtR41N9V5awgstOWZeyaYUEKjaE7roYiZXVnsCgjE6BXa74MAhX9HybBF4dMw8y
	1P+yyvdfFh5iSfJibGnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj55a-00000007tgL-1DfE;
	Mon, 13 Jul 2026 01:04:06 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj55X-00000007tcq-1fi7
	for kvm-riscv@lists.infradead.org;
	Mon, 13 Jul 2026 01:04:04 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2cce6a0c9c3so23187205ad.1
        for <kvm-riscv@lists.infradead.org>; Sun, 12 Jul 2026 18:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783904642; x=1784509442; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rpV1zK6+w2gomPz2kgJsMZZImbuU17m/e3kCCv0XAXs=;
        b=SAerLdE/cORlAgj3bCAwmopm5Kt49YB1EnCz+nyZq7p8xws+9nFo77B5cP35Jmy8eS
         vPMLkP4tw0XJf4DgFvoOISR6+q27Lu+XNmzhelsvRGnVCsWYzoyhvrKdVtiE4tvFZZVc
         sS1rlXR5mFuvGC97fSSKMf69CEXwMdP11OZAN7kHmO+zAfmp7sul6EZfmPUzEOx3gVTZ
         /aN9JlnKSSwHeHwzgKynwm0IIyq4Ub/liCrAQRb2HnK5ltm3yGw1pVP6gEGkWH2fEEFP
         PfxO8756YMJAd7A7EnqYaZds+3V9wyyJOBhMTE/QecWjAKRGywBmdNvIVyIZyD9AA/WR
         4tbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783904642; x=1784509442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rpV1zK6+w2gomPz2kgJsMZZImbuU17m/e3kCCv0XAXs=;
        b=Wevj8u3fcNmBnh3yqcBbHu45u129551t7GFtSfSEww585h8OC3vnXm39MLIiWsOICA
         mR4LAILtVEHSwRjuggh4mEjuvVd7aU+3L/KdP0zNT7UQXY+hwOrsxEiQ0VCJQxk+7xKL
         1SpIzv/rmICPMZi3U1C3HkjDI5HU+NQSEiFEErIujj37HtHGT+2DS0/aWkhcSc6hVixh
         fCLx57bHGjbm0otua2ZfZhMvqgPoLXB5Kjy8HDtGrnHqgRa4IdqU8JjC45G3z3T5ODro
         nuIqEP3gKmF0mhuQEfdA5c5Q4SjP0uMMl57BUaeZGaSkq0D4GdVbbs90hG16Bvqq7g55
         /43Q==
X-Forwarded-Encrypted: i=1; AHgh+RpvkVsUlbAYDpifvmqRo1DrNQASINxQszbSnCY979d0WdBEC7U/YtRbj5f6hNy17qrGpG7/xqu/c0s=@lists.infradead.org
X-Gm-Message-State: AOJu0YxAMxBFlZKodlEkA8F3bBdX+zD8owW299k+LAkj+X3poDGFSpa6
	4pS4Capo1PWSq6WgGztMkoy304ynPrpS77LR6it7IIi8yXoStymAK1df
X-Gm-Gg: AfdE7ckjhokjDymwHA9pwQqo6h/3E9tZZxg5cmXGMf8ZFQv6EMCIGyzRdK9FB6sFu6U
	Eezv4HoLHuMtWmTh1k9eVWW+lzIIAKSRZpLk1Wgn9rkIbbPIMlWcjXaAq+VTCl146WS8OHApL+n
	9AsSG2G6G+vH5NSzuf8ucIeofQCrJS4T3NRukzPpfpjaNeJZxxhoRjfwSOVxLj8anlKeM6a+bTx
	U6KAd85nkzQRcu1je8ipvQ4SuZDzGXvb+pZfTlrKHzNuWvMJY/Tg3qmla93Lx434Rhlh/oQYLRL
	GuQmqBCwNcejYF0ft0FcaqztypLdAUXUhLjE140WYdykz3wDItLZpcT/Zq+tvtvCtlYKIOXX8fD
	f5up4X317QAZ/JJN8bIm8zPugU+CGxw9cQ1OMUJcTP9CZ2gQ6vKUeAGji45NIlS6gp7cyurxU+S
	gR57+Q2RPq2Kg=
X-Received: by 2002:a17:902:e806:b0:2ca:619f:9733 with SMTP id d9443c01a7336-2ce9eac58f9mr71900625ad.17.1783904642652;
        Sun, 12 Jul 2026 18:04:02 -0700 (PDT)
Received: from localhost ([121.250.214.124])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bdb746sm89165375ad.7.2026.07.12.18.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 18:04:02 -0700 (PDT)
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
Subject: [PATCH v6 5/8] RISC-V: KVM: Handle software-check exits for VCPU
Date: Mon, 13 Jul 2026 09:02:58 +0800
Message-ID: <20260713010302.303278-6-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260713010302.303278-1-inochiama@gmail.com>
References: <20260713010302.303278-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_180403_450080_F99CC47B 
X-CRM114-Status: UNSURE (   9.67  )
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

The extension Zicfiss/Zicfilp introduces a software-check exception
to the privilege architecture. Delegate this exception to VS mode
when vCPU enable Zicfiss/Zicfilp so the CFI violations in VU/VS could
be reported.

Assisted-by: YuanSheng:claude-4.7-opus
Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/include/asm/csr.h | 1 +
 arch/riscv/kvm/vcpu_exit.c   | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 31b8988f4488..224af9facf1f 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -117,6 +117,7 @@
 #define EXC_INST_PAGE_FAULT	12
 #define EXC_LOAD_PAGE_FAULT	13
 #define EXC_STORE_PAGE_FAULT	15
+#define EXC_SOFTWARE_CHECK		18
 #define EXC_INST_GUEST_PAGE_FAULT	20
 #define EXC_LOAD_GUEST_PAGE_FAULT	21
 #define EXC_VIRTUAL_INST_FAULT		22
diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
index 0bb0c51e3c89..12eebeabdf14 100644
--- a/arch/riscv/kvm/vcpu_exit.c
+++ b/arch/riscv/kvm/vcpu_exit.c
@@ -243,6 +243,10 @@ int kvm_riscv_vcpu_exit(struct kvm_vcpu *vcpu, struct kvm_run *run,
 		run->exit_reason = KVM_EXIT_DEBUG;
 		ret = 0;
 		break;
+	case EXC_SOFTWARE_CHECK:
+		if (vcpu->arch.cfg.henvcfg & (ENVCFG_LPE | ENVCFG_SSE))
+			ret = vcpu_redirect(vcpu, trap);
+		break;
 	default:
 		break;
 	}
-- 
2.55.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
