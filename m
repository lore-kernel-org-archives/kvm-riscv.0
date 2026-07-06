Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85708C43458
	for <kvm-riscv@archiver.kernel.org>; Mon,  6 Jul 2026 02:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fmmvRUE6gi+35DV1HjmrdvSkFgzplHQ56zCgIbtGR4g=; b=1SGI1HIMDtqiLl
	3siMPDOlbQ8PFhn6HwZwtk2CDMqUVZSK6wH1qpFPXDkj4D0W6k5exg1mNOanT+ccR+44SDWYBIpV5
	kxzPL3V3sg0c3KfmUnRODYxTJq4wNKtUMlicJSdECMxdhulOjdGLJNHn8ihdfpwVi2nLa5YtqlNJS
	5QDjoIhNTVY3fUCUJDWOK/WRluA/eybKWpwoGsFbFqfGyzLudfC/1VQSPC69uY2FZLcqerQS1MdVu
	uNUE9yI9FbCMCo6ZpFPxqfAeTofIrdhyeY4Nu+ksfON4zZxlk0n3+RGM3ttkPiSfxbzI5FYY0v20W
	ldSt+9pI4AvAfdKBWSdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgYxv-0000000BNZ1-3Qrd;
	Mon, 06 Jul 2026 02:21:48 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgYxt-0000000BNUn-186W
	for kvm-riscv@lists.infradead.org;
	Mon, 06 Jul 2026 02:21:46 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2cc80b585bfso7238125ad.0
        for <kvm-riscv@lists.infradead.org>; Sun, 05 Jul 2026 19:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783304504; x=1783909304; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rpV1zK6+w2gomPz2kgJsMZZImbuU17m/e3kCCv0XAXs=;
        b=T1vT17o63Fiz8NbD+3QRGKEJic2kICCHJgi6fjNSabJsGrIwWLGAxNkL5GEZa3PeLg
         ScdKzeAyGaQC4ZE/0p1/vhjFfxQ4OpisulY/bN2MBxxOPNkfI+CVcimkuG2gWe/pVd0o
         S3QlGhVg0uCYGsnP7KDzyaptLaiXEcYCQlFdJSJHCYtp5QAEjxPs7XbmYZCyiEbrmZ8d
         itntscUWuJF7f9RIYXAQsNaq9v0KNy68BLr4aiAY/E1cVU4SzwPXRweKJUvyVFuNfy/e
         U7ar4qdd3vV803nHcodAKV0T2GA1LGqF6x4e1emhyWGCvcqAlYVa1DaVat3TfVU6jlOy
         43TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783304504; x=1783909304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rpV1zK6+w2gomPz2kgJsMZZImbuU17m/e3kCCv0XAXs=;
        b=VX1Rm+lpgz1S/le+TRgZqV7JSOwzMXVgIuP090jQWI71OzwLhhFWEo38zSJuVXZRiQ
         UlVwPX9TN9sjvAOPvucXuFRT/Oxuy3irjLOcRPGlW/CvUW/kT2vHR9ADH4ruiZhzKguA
         yNzHYjkdixt4PKrciFi9cPJxgIrhBW7kWJn9oRlu9K0jQ/uNKGJh04+ZnTp6Rmy58gdR
         9DefAmtGAjg4Kczo4KTT1xB+LtTY0xWClYnG+sW7fFyaEgNRryrb7qDiANz5vs9z5/Cs
         vG0FTNOr9m+4ddXU0zfLb6dBGIE5KjY25Yq1FKC3hgYVq/fbWkR6/FRf7QRQtPP8WI9G
         WZOQ==
X-Forwarded-Encrypted: i=1; AHgh+RqfXVNItyJfWfO3QcnVYyaq6WBiO8q7fdrQEJSfdBMyJYj5UZqW92W/4PgiM3icEP6FxehEsZZ/rRs=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywlq+Ly9kvQJVLVKsIglTfv6fFcjJOa+imfWlIFb6FJbfTbOIZ7
	PlR/ZTdvwEsglBTa4i8S3oYhdshZGSvsI1F8YGdIWyPZd8uujW6v39DM
X-Gm-Gg: AfdE7ckHXibwe6DYJNrTfEInY+v9eRnUqFDWdWl9aK5y4Q9k8DcWI9y3a947TVByMEL
	t34lGaet4wHf5xJDrAceZOgzhQEu+0oJTO8HQo/hB4phMvZR+YVskyApXQZfviofhyXfbJd1dO3
	9HtP0BeeFV096hYuGcaOoDatJzbLrqO8yz7U1Ez3P3OHtoPmlIgKqdPk8sEDToeDyXLkPLLM3gm
	BOM7bl6IYWtUcn4UAH8HbWvHNyI7EOXzSmHc/iJNwDFCBZiV1/sJXooyALdMNYrnf8tAeLNgs46
	RFQGuehSiPqeVefhFGrCSRniV63yND4tvs8PCKBZsJk+uNRTSO7rfszAq/EYGJhpbbLsBbxgYUB
	FHZ+kAezb5no8heokMgw1YYZITrBmsZ8b6wYhucTpH6MQN7NGEPMNeM+x0NGIWji1
X-Received: by 2002:a17:903:2341:b0:2cc:864b:539 with SMTP id d9443c01a7336-2cc864b08c2mr41134205ad.6.1783304504462;
        Sun, 05 Jul 2026 19:21:44 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad776516dsm39837995ad.52.2026.07.05.19.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 19:21:44 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Sergey Matyukevich <geomatsi@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Deepak Gupta <debug@rivosinc.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Quan Zhou <zhouquan@iscas.ac.cn>
Subject: [PATCH v5 5/8] RISC-V: KVM: Handle software-check exits for VCPU
Date: Mon,  6 Jul 2026 10:20:41 +0800
Message-ID: <20260706022046.214956-6-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260706022046.214956-1-inochiama@gmail.com>
References: <20260706022046.214956-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_192145_382197_14C15A41 
X-CRM114-Status: UNSURE (   9.22  )
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
