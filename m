Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A69F1C71134
	for <kvm-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 01:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PKSOw9hLnUkGf7vO2hB45uHSDuyuSVp/lpsvxXQYb0A=; b=g8kFmBcVIspgPQ
	in+nhR+yxoXsMyEEx1XYIXsK6ZsmloTXSPhl2gwFseqDyQ69rzaZGaaYdGv4XxMK77GsklBS01xyI
	vhib7Q+keEzhOrMTKnM91dji+GP7kfs/ulCsyeJ/I3htDVlxWyIq6zKCVIvzYg+k5Yk8w1kKsHhmf
	eTVU31bh7Cp/H9Z2xEMdptCXscRjdTyBJqAuF3GsJIqpciqqZOYAbTice+U+HUa2GksZXgl6mOD6I
	iUVD5Jke5LG/4/0TjlbQlA9+DdLSSy62AvK474MGYUHKFee1HJiYSgpvq57wToRIDpcTgkOPe2oJK
	XJ0ls8I9NhWc4D63I10g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPACC-00000008Xec-1jqE;
	Wed, 11 Jun 2025 01:24:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP93O-00000008SCB-3kYe
	for kvm-riscv@bombadil.infradead.org;
	Wed, 11 Jun 2025 00:10:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=6JPxC6M/8C78oUmZk1MgMr9DeqlObfjqst+28w3sGNI=; b=IJPCAoSexDuwYNXbxuI8GirMA3
	5sHvGGHf/EQOywnBzcB9m/RmGhsHv3bqS/TUyHE/8A2ccngds5p1TOv+DBLvRrSXpmdylImIfpoth
	gfjYEMr6pVJiVfwHe0vbnCnfbevn0oZT3OjF+fBgkDpPu1vPn5zgom8+VQ0ojfujzq9U20S6+Rpox
	QgtUVZQkh4NH5aooD4rF5snJnltCGc5WT5/iCoSOiAiTJWR2TlfPAokljWcfzt+55chBS4+ZAA7GZ
	AXNDOFU/j/NjxNbVgo0AJIrJt85/nh8W2BSxo6W7BujP+R1qKSEFp1jPKk+BadCU2vzwX3Tj10TN+
	6gKppN7Q==;
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP93M-000000022R7-3XEZ
	for kvm-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 00:10:54 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-311b6d25163so5171379a91.0
        for <kvm-riscv@lists.infradead.org>; Tue, 10 Jun 2025 17:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749600649; x=1750205449; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=6JPxC6M/8C78oUmZk1MgMr9DeqlObfjqst+28w3sGNI=;
        b=GtvNxwstXsRLgfrtRtQ1ajrnybbKV0oXBX5V/IHUANdof2xmaaYTcIsv7qjn5r4q/H
         iSK6po3KJwIZfP8QGF1qw5YWLRme/WSkUO39+jZYB4acXUZtrhf9VSrNJ5hBYDklqZR7
         fDIVg1yMFBqe1lonM8ppahagdgfsC3NPdoXmcZ/WrrBVtIk6Qv6miXS836lZpLlOUyuh
         F46+oSbD8zJ/fq1DM6QtLkNE69n/onR6Bjg+H0S7xaJYjXekEoCjeEU9CD4HoK+sQYpZ
         3yJzyOGRVVagvOcODr9oDuN8DuYgCzMANROTWCDM8ufXX5aGqpZXtevaYNhDNyHZSxL3
         iFig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749600649; x=1750205449;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6JPxC6M/8C78oUmZk1MgMr9DeqlObfjqst+28w3sGNI=;
        b=Zg4L08E77mIEgQiuEYRyaQ/XMwPS+9eMv1Z5P6XDpkYQHMeWNMjRMbrtC3JRe/XwLY
         aGqrCCPrgvw2J7Akhjo1gxchQ/7npH6diMNtWHuvAFRfVBjhYAOIRjGPW41RhsYMRdkg
         jqu6tO+2oTwZEIHL/hr2u5PFAgjfyh+Yx1BN+2KWrD8dcSZZXVYBXOnW7bysiHH5Z5J3
         dO9qqI/IvBUDiPWcqWLBxnfJlFgMZYAxM2VXOC6W7rx0qgfnfCB6pLPrxKsH+IoeP3Zr
         9mkQs75HzXCbcyCVJ3fnvz26ZU28yhr4IlddQ4Ofj/WMUG2rdnbdcZljGZS8NT4c2jVl
         9EYg==
X-Forwarded-Encrypted: i=1; AJvYcCUDUEjsDU6NudeDCOtj7HTJHLFtJSfYmwrRqexhPA9D6a2PgZYiBwFcpfTAxPZiW2WvBFa2ehQTuSE=@lists.infradead.org
X-Gm-Message-State: AOJu0YwAVLx9U0b/awrudREl5wuLWD+1SygRREAPipPTGEDJ0pvhCJsK
	7LuASkp7aSIm5W09C+KufbsTndjl/ugYJ4t5D+YuwlZzY+pDUmBNv3ylFaNJZvVdaSq+kve9F06
	VnrnIsQ==
X-Google-Smtp-Source: AGHT+IH8G3icYEi+L3rUhxMgi7kY7xVjk4t0ltvPAXoSgaLu6NXS+iOsy9Z0A/wrYNq1F2Q9c5lqhoRbAbQ=
X-Received: from pjbsm18.prod.google.com ([2002:a17:90b:2e52:b0:311:c7f9:ca1c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:52:b0:311:b0ec:1360
 with SMTP id 98e67ed59e1d1-313b1ff8de6mr923707a91.29.1749600648794; Tue, 10
 Jun 2025 17:10:48 -0700 (PDT)
Date: Tue, 10 Jun 2025 17:10:36 -0700
In-Reply-To: <20250611001042.170501-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250611001042.170501-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc0.642.g800a2b2222-goog
Message-ID: <20250611001042.170501-3-seanjc@google.com>
Subject: [PATCH 2/8] KVM: arm64: Include KVM headers to get forward declarations
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
X-CRM114-CacheID: sfid-20250611_011053_015605_E6D0D32B 
X-CRM114-Status: UNSURE (   7.89  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

Include include/uapi/linux/kvm.h and include/linux/kvm_types.h in ARM's
public arm_arch_timer.h and arm_pmu.h headers to get forward declarations
of things like "struct kvm_vcpu" and "struct kvm_device_attr", which are
referenced but never declared (neither file includes *any* KVM headers).

The missing includes don't currently cause problems because of the order
of includes in parent files, but that order is largely arbitrary and is
subject to change, e.g. a future commit will move the ARM specific headers
to arch/arm64/include/asm and reorder parent includes to maintain
alphabetic ordering.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/kvm/arm_arch_timer.h | 2 ++
 include/kvm/arm_pmu.h        | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/include/kvm/arm_arch_timer.h b/include/kvm/arm_arch_timer.h
index 681cf0c8b9df..22cce6843e9a 100644
--- a/include/kvm/arm_arch_timer.h
+++ b/include/kvm/arm_arch_timer.h
@@ -7,6 +7,8 @@
 #ifndef __ASM_ARM_KVM_ARCH_TIMER_H
 #define __ASM_ARM_KVM_ARCH_TIMER_H
 
+#include <linux/kvm.h>
+#include <linux/kvm_types.h>
 #include <linux/clocksource.h>
 #include <linux/hrtimer.h>
 
diff --git a/include/kvm/arm_pmu.h b/include/kvm/arm_pmu.h
index 96754b51b411..baf028d19dfc 100644
--- a/include/kvm/arm_pmu.h
+++ b/include/kvm/arm_pmu.h
@@ -7,6 +7,8 @@
 #ifndef __ASM_ARM_KVM_PMU_H
 #define __ASM_ARM_KVM_PMU_H
 
+#include <linux/kvm.h>
+#include <linux/kvm_types.h>
 #include <linux/perf_event.h>
 #include <linux/perf/arm_pmuv3.h>
 
-- 
2.50.0.rc0.642.g800a2b2222-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
