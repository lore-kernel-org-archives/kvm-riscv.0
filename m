Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F668C61DB2
	for <kvm-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 00:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P3JzLLzQVUg2w7vqBO1f9R236KFs3EhAStnwxs1EC6U=; b=rj0naeW2MktXsy
	taOUm74wah8/AcwhY2+dQ2BUMQxGZERUayqwR467OrtR0UuTgpyY4vCU30D49GYpob1iC28KWz/JL
	fYsR5grS1mJx1jgqy9n3b3Es6JuQVTlU28KbqILwHE7i2rWbiyjIQIywDY+Qmbc16EDZVBK95PbwL
	IpitCySA9FVBwsEGDljbLZtutjQ0PEa5Nu0frA5FZ7sq9hdjCfvOe5msAF/SydXSWigLng0ydqFUf
	BHWWuC7UR4JoZcM340EXZHKql5QAWocaEOUZWpmiJsdb9VCa/xyhQihTQvaNpz8q7nVg1kzJI9LLR
	Xj6JMHDK1EzOhc/L4qFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP9KO-00000008UAh-0HhS;
	Wed, 11 Jun 2025 00:28:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP93Y-00000008SFh-01Cd
	for kvm-riscv@bombadil.infradead.org;
	Wed, 11 Jun 2025 00:11:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=t+Mj+r8r7UAjF4+0LNUZhsvI8NJHwfinPsCt24LIifo=; b=HnMazRVk1jCWTt5l39Bvkc8+aq
	uYsLfKraF7kT4VrwuFOnjcMHPbE8zV7Gc4fvA2KaeqwRQ3reWM3ZMWLr1Og8rUU7aUeZOT1t3rdJ0
	sNUoObEtnh+NI9LH2Im+tm/UdbbPhajFV6M4fP015wJ/zX5y34JhY31x6wKNHN2xpDM33OtH6IgX7
	bkUwoTEH0p8DHbclRZnlUcoByMUpLBFgU1qb6d85uXBZBuhAQzq3wSxF/00ZgdM5s9ovmdxGTrOoj
	nRZj3y7aRu1Ow54nkqt1u6YONYBMdqAsMI7J9t5vK1WOWvGYN7yT55OQ3YFDL81DxXyjivBbu9JU1
	bc/JVbyg==;
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP93W-000000022Uj-0hMm
	for kvm-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 00:11:03 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-748475d2a79so2410162b3a.3
        for <kvm-riscv@lists.infradead.org>; Tue, 10 Jun 2025 17:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749600659; x=1750205459; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=t+Mj+r8r7UAjF4+0LNUZhsvI8NJHwfinPsCt24LIifo=;
        b=oAYpn/luT59nFlYSjGzpktDwLlRXQTfsjcsmFitCxyb9WCwlW/CbvTeDWSM1WDKElh
         EZmzjyKLEPA6QgSDOg7UigrzEP56K7eI0HK9Dy0Ce9luvI8TPfF7aaCZ8u+Dl+6nIEtu
         VrhztOu9kVUSyfje40ks1tz2r9KwmjyW3eV/dSee8Cn6ayUvZgDWQSJgYAdMwP4WdDny
         D44S7KSiEk8sJEtbbYyUeQRLW2mnzWrLfUfrqMK5+PA5DM3lMjY/4U79cM1I6ejrIv5y
         RGz376rBDodo0MlWpiVJO2et9vigL+jkZ4i+AG3PEcF0whqN0RSQePuLHuCSuKvj611V
         IdIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749600659; x=1750205459;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t+Mj+r8r7UAjF4+0LNUZhsvI8NJHwfinPsCt24LIifo=;
        b=MUfYAadRAE58vXtHSMfhBiHQsUuj6QXPZ4J94UXtcoFHK/JG3Bc7udVaQJlxs5GRBc
         O9b4MkU3n/WLSj8JR6K/pr/SiJgzQlKOqnToktFvA9D1eemB8SMtLmloVbd3af+FYrQA
         9tp70lC0rt1ROOjm4DJ4A+bDWIguJEZ9paUgo1db2ySJEXNA87GSMoq1sm6hXg9UL20U
         eho1nzsCI+l4Kvo6TyhxuS1IbHKPIEmSG3Ss3a12pSXQ8yYKeVhzesnXnGK1b1Rk3tFr
         Bz8O2404iy5RUKRpRrjASAemRK6YuE/4gsVdTQHAXEsxSNpAEcYflN4op2SuNbKSCJMR
         9htw==
X-Forwarded-Encrypted: i=1; AJvYcCXpbeANl0Z7/tYAqJU/OEZJ4gH/Jbi8yyskg+Ems7DxPOBCYiCsN8gy3QMVWEjqyt7TVPGRRweb7rI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4hf14sqv4PfVGTErjgbBeBKF0lOln7O4bHO366XI+KTnu69CR
	G+VGZkLtWyIH6v8DI8veEdVCamfB/xerI3sgmwjYLcgIoUpI+6fVt58d9H1edPghPk9b7m6DBe8
	qccXwqw==
X-Google-Smtp-Source: AGHT+IHdKstC+XlYUus8Wdm0HR7HPxHMBlUy5ahB8xm3L+Y1hmecIZTBPJ5vhN4Gi0qdwz1eVbXtQ9xfH68=
X-Received: from pgam16.prod.google.com ([2002:a05:6a02:2b50:b0:b2f:6348:f715])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:9012:b0:1f5:8f7f:8f19
 with SMTP id adf61e73a8af0-21f8663f76dmr1960513637.10.1749600659002; Tue, 10
 Jun 2025 17:10:59 -0700 (PDT)
Date: Tue, 10 Jun 2025 17:10:42 -0700
In-Reply-To: <20250611001042.170501-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250611001042.170501-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc0.642.g800a2b2222-goog
Message-ID: <20250611001042.170501-9-seanjc@google.com>
Subject: [PATCH 8/8] KVM: Standardize include paths across all architectures
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Anish Ghulati <aghulati@google.com>, Colton Lewis <coltonlewis@google.com>, 
	Thomas Huth <thuth@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_011102_253965_E6733F7D 
X-CRM114-Status: GOOD (  10.81  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

Standardize KVM's include paths across all architectures by declaring
the KVM-specific includes in the common Makefile.kvm.  Having common KVM
"own" the included paths reduces the temptation to unnecessarily add
virt/kvm to arch include paths, and conversely if allowing arch code to
grab headers from virt/kvm becomes desirable, virt/kvm can be added to
all architecture's include path with a single line update.

Having the common KVM makefile append to ccflags also provides a
convenient location to append other things, e.g. KVM-specific #defines.

Note, this changes the behavior of s390 and PPC, as s390 and PPC
previously overwrote ccflags-y instead of adding on.  There is no evidence
that overwriting ccflags-y was necessary or even deliberate, as both s390
and PPC switched to the overwrite behavior without so much as a passing
mention when EXTRA_CFLAGS was replaced with ccflags-y (commit c73028a02887
("s390: change to new flag variable") and commit 4108d9ba9091
("powerpc/Makefiles: Change to new flag variables")).

Acked-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/kvm/Makefile   | 2 --
 arch/mips/kvm/Makefile    | 2 --
 arch/powerpc/kvm/Makefile | 2 --
 arch/riscv/kvm/Makefile   | 2 --
 arch/s390/kvm/Makefile    | 2 --
 arch/x86/kvm/Makefile     | 1 -
 virt/kvm/Makefile.kvm     | 2 ++
 7 files changed, 2 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/kvm/Makefile b/arch/arm64/kvm/Makefile
index 7c329e01c557..86035b311269 100644
--- a/arch/arm64/kvm/Makefile
+++ b/arch/arm64/kvm/Makefile
@@ -3,8 +3,6 @@
 # Makefile for Kernel-based Virtual Machine module
 #
 
-ccflags-y += -I $(src)
-
 include $(srctree)/virt/kvm/Makefile.kvm
 
 obj-$(CONFIG_KVM) += kvm.o
diff --git a/arch/mips/kvm/Makefile b/arch/mips/kvm/Makefile
index 96a7cd21b140..d198e1addea7 100644
--- a/arch/mips/kvm/Makefile
+++ b/arch/mips/kvm/Makefile
@@ -4,8 +4,6 @@
 
 include $(srctree)/virt/kvm/Makefile.kvm
 
-ccflags-y += -Iarch/mips/kvm
-
 kvm-$(CONFIG_CPU_HAS_MSA) += msa.o
 
 kvm-y +=    mips.o emulate.o entry.o \
diff --git a/arch/powerpc/kvm/Makefile b/arch/powerpc/kvm/Makefile
index 1a575db2666e..6f12edd465df 100644
--- a/arch/powerpc/kvm/Makefile
+++ b/arch/powerpc/kvm/Makefile
@@ -3,8 +3,6 @@
 # Makefile for Kernel-based Virtual Machine module
 #
 
-ccflags-y := -Iarch/powerpc/kvm
-
 include $(srctree)/virt/kvm/Makefile.kvm
 
 common-objs-y += powerpc.o emulate_loadstore.o
diff --git a/arch/riscv/kvm/Makefile b/arch/riscv/kvm/Makefile
index 4e0bba91d284..dbe61a398cc8 100644
--- a/arch/riscv/kvm/Makefile
+++ b/arch/riscv/kvm/Makefile
@@ -3,8 +3,6 @@
 # Makefile for RISC-V KVM support
 #
 
-ccflags-y += -I $(src)
-
 include $(srctree)/virt/kvm/Makefile.kvm
 
 obj-$(CONFIG_KVM) += kvm.o
diff --git a/arch/s390/kvm/Makefile b/arch/s390/kvm/Makefile
index b742e08c036b..5cbcaa7f241a 100644
--- a/arch/s390/kvm/Makefile
+++ b/arch/s390/kvm/Makefile
@@ -5,8 +5,6 @@
 
 include $(srctree)/virt/kvm/Makefile.kvm
 
-ccflags-y := -Iarch/s390/kvm
-
 kvm-y += kvm-s390.o intercept.o interrupt.o priv.o sigp.o
 kvm-y += diag.o gaccess.o guestdbg.o vsie.o pv.o gmap-vsie.o
 
diff --git a/arch/x86/kvm/Makefile b/arch/x86/kvm/Makefile
index a5d362c7b504..f78f11b582d2 100644
--- a/arch/x86/kvm/Makefile
+++ b/arch/x86/kvm/Makefile
@@ -1,6 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 
-ccflags-y += -I $(srctree)/arch/x86/kvm
 ccflags-$(CONFIG_KVM_WERROR) += -Werror
 
 include $(srctree)/virt/kvm/Makefile.kvm
diff --git a/virt/kvm/Makefile.kvm b/virt/kvm/Makefile.kvm
index 724c89af78af..0e7ba49026fc 100644
--- a/virt/kvm/Makefile.kvm
+++ b/virt/kvm/Makefile.kvm
@@ -3,6 +3,8 @@
 # Makefile for Kernel-based Virtual Machine module
 #
 
+ccflags-y += -I$(src)
+
 KVM ?= ../../../virt/kvm
 
 kvm-y := $(KVM)/kvm_main.o $(KVM)/eventfd.o $(KVM)/binary_stats.o
-- 
2.50.0.rc0.642.g800a2b2222-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
