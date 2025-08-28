Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8706DCA0EFF
	for <kvm-riscv@archiver.kernel.org>; Thu, 28 Aug 2025 00:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qEkYKXNuTgQnxCMH+9zM4jWb5+Fl1gSSbuzCxRNrLY0=; b=bfy2s9jtBDCbCk
	7DkKVsBOduDln73kK7BBZwCqjQ7gXPcKH517edFYjF/QEHh5IM1BYFvj7JW0Jr8/m6VSSzvCVPbLp
	RrQTzk33sK9GzjT7l+h0iKQ3eV2Gghi+eU70qvpPhP0HOhxhDdZas80jqxllo+74mo3lz2yj75Emc
	vnYmvlAxHxgr9aCZCAL6A7IO4K+wCd6taa+At6sF+QzluvkpN+S2bPxo9dKEpdEeO0VBcGxFbBo8y
	mLw2BOTOC/vMuKUdNuvI7qZvLSIQY9c24gRvEosKCTPmq/AscYKYnvvfdZj2thfC1/9gNu0jA29ps
	WnXwRWAjivZzte3Ad8uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urQJa-0000000HKbj-0QUb;
	Thu, 28 Aug 2025 00:16:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urQ5r-0000000HICq-4B0T
	for kvm-riscv@bombadil.infradead.org;
	Thu, 28 Aug 2025 00:02:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=EmsaxLywmqXJrqAtwLwAP27sFBwlzqDgNEuWnDn/370=; b=Mg81vVFr1ruzxefGlsSdI9trd4
	8AgV2zQw+ATuQ5byx98wxG50lJ+D3lOezWQoTLIArL/skwFRoT/Z4HxQYO5jhUZ6zCqhqp5mtZW+I
	k5301nETXU1a1ecgaCYTyMZrx1qnYhyawLF3/PmxvsFei3a2csaI6dCnIkrVmNWe/vH1FPf/wb3KZ
	rSEKaD4LKcUUS9s7hqUnl3Ms1koXK4cTAVRZkNpxrgIDcrYmWwZDaovR7CdBVj4NdS4QkLw0MRXa1
	8ATGfYWmGtU1YTwCkBREsy8nM6FiFs/qDkMTzDNbqCmmbiMrS4UE/wdd29ZGUDW472mHpJT7eZUGW
	cFZrTIEg==;
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urQ5m-00000002YG4-3sDL
	for kvm-riscv@lists.infradead.org;
	Thu, 28 Aug 2025 00:02:18 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-324e4c3af5fso368340a91.3
        for <kvm-riscv@lists.infradead.org>; Wed, 27 Aug 2025 17:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756339333; x=1756944133; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=EmsaxLywmqXJrqAtwLwAP27sFBwlzqDgNEuWnDn/370=;
        b=kFLL3GA9avgCZFMH52fVxJ1BO1miRSQydAsGRmCRgpFB4xCuhEfvdB0Bz9JJXUMK7O
         Ir3j74eDguKP1AekgEThdBeeWkGJDbw0xoLYttwYbmoXufS/HWCvXCFc7GpphMFyEpTh
         bmNAzDHPqA0zevTcjWYEUtlbmTe3vr+j74RkRA6J6Fqnv6dF7LKbX6yc0uPtXghMB3JB
         oU6NWsgHtK1gR4Nxh6tQbawFweh2e2BABPg3l9Tw2EyVEt3vF91PcJFvbfRWdWHG/b3U
         bw715WHCPgkdR+tZr86p1BJSnsrfayVrNJaQfoQ4gWe0DbN3TOIqezjWp3WbS8EAHlDs
         p4Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756339333; x=1756944133;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EmsaxLywmqXJrqAtwLwAP27sFBwlzqDgNEuWnDn/370=;
        b=Y03Y0VMyjYSfHsTG3OOGWP/zJjer5gJALnz4o9CSI4C3DMtyA37vmQ3jZM550sx/Q/
         CEslOQOQKonpzW3H/Pp33WbwOenOQrC1j465aE2Dyae9NOpVD7lYh6INEDxX5S4pfNzj
         wmoTkHZTYttB3oqbCTy+/fUMWIso0QNVWSJUtvy+5T+NELFPCME9uIqK1f8olfQKZ7ek
         49im28rjr7n7ZjfD16yTwTT2k+Dg7ZQtcBlmK4+MKbLa5njrc19tbA88GQLxnMYlSUhf
         U8yXX9xWoFHlvw/Y+LLO/nK+PODWdcN6x2WQ8XDPMu3mEfuv/vO39KTs/QtXt/Gkm94E
         0gsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYmpsseoHsnpz01p1hQyGlmwvQUa3GJuBiE1rNxZcGW6sAyKmvk5GmANQpj9JupRdqpSKOmu3VykQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YzTvye/pv+NDQeWJvBoVZnvoNn+GJLiH1ZbRFnfGWM2uUMRBi3u
	jsCgxuZySDe82BSWDGG7+z8N67FKPzZ42XyuDMfYnH/DwzToVkHATbOI4rQ0K1roCj5JlaheagO
	lM7Bz0A==
X-Google-Smtp-Source: AGHT+IHWkrv7kVZHVzSto7MjJE9ImCnU6mvGeqto5tWqGBVv3p+HjVdYjEAK6cb7aWSN7qrvwO4+vOKCqys=
X-Received: from pjur11.prod.google.com ([2002:a17:90a:d40b:b0:325:9404:7ff3])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2785:b0:31f:9114:ead8
 with SMTP id 98e67ed59e1d1-32515e2d5a0mr28901913a91.6.1756339332928; Wed, 27
 Aug 2025 17:02:12 -0700 (PDT)
Date: Wed, 27 Aug 2025 17:01:55 -0700
In-Reply-To: <20250828000156.23389-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250828000156.23389-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.268.g9569e192d0-goog
Message-ID: <20250828000156.23389-7-seanjc@google.com>
Subject: [PATCH v2 6/7] Drivers: hv: Use common "entry virt" APIs to do work
 in root before running guest
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Peter Zijlstra <peterz@infradead.org>, 
	Andy Lutomirski <luto@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Frederic Weisbecker <frederic@kernel.org>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Josh Triplett <josh@joshtriplett.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Uladzislau Rezki <urezki@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-hyperv@vger.kernel.org, rcu@vger.kernel.org, 
	Nuno Das Neves <nunodasneves@linux.microsoft.com>, Mukesh R <mrathor@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_010215_717826_376D6D2A 
X-CRM114-Status: GOOD (  13.99  )
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

Use the kernel's common "entry virt" APIs to handle pending work prior to
(re)entering guest mode, now that the virt APIs don't have a superfluous
dependency on KVM.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 drivers/hv/Kconfig          |  1 +
 drivers/hv/mshv_root_main.c | 32 ++++++--------------------------
 2 files changed, 7 insertions(+), 26 deletions(-)

diff --git a/drivers/hv/Kconfig b/drivers/hv/Kconfig
index 2e8df09db599..894037afcbf9 100644
--- a/drivers/hv/Kconfig
+++ b/drivers/hv/Kconfig
@@ -66,6 +66,7 @@ config MSHV_ROOT
 	# no particular order, making it impossible to reassemble larger pages
 	depends on PAGE_SIZE_4KB
 	select EVENTFD
+	select VIRT_XFER_TO_GUEST_WORK
 	default n
 	help
 	  Select this option to enable support for booting and running as root
diff --git a/drivers/hv/mshv_root_main.c b/drivers/hv/mshv_root_main.c
index 0d849f09160a..7c83f656e071 100644
--- a/drivers/hv/mshv_root_main.c
+++ b/drivers/hv/mshv_root_main.c
@@ -8,6 +8,7 @@
  * Authors: Microsoft Linux virtualization team
  */
 
+#include <linux/entry-virt.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/fs.h>
@@ -481,29 +482,6 @@ mshv_vp_wait_for_hv_kick(struct mshv_vp *vp)
 	return 0;
 }
 
-static int mshv_pre_guest_mode_work(struct mshv_vp *vp)
-{
-	const ulong work_flags = _TIF_NOTIFY_SIGNAL | _TIF_SIGPENDING |
-				 _TIF_NEED_RESCHED  | _TIF_NEED_RESCHED_LAZY |
-				 _TIF_NOTIFY_RESUME;
-	ulong th_flags;
-
-	th_flags = read_thread_flags();
-	while (th_flags & work_flags) {
-		int ret;
-
-		/* nb: following will call schedule */
-		ret = mshv_do_pre_guest_mode_work(th_flags);
-
-		if (ret)
-			return ret;
-
-		th_flags = read_thread_flags();
-	}
-
-	return 0;
-}
-
 /* Must be called with interrupts enabled */
 static long mshv_run_vp_with_root_scheduler(struct mshv_vp *vp)
 {
@@ -524,9 +502,11 @@ static long mshv_run_vp_with_root_scheduler(struct mshv_vp *vp)
 		u32 flags = 0;
 		struct hv_output_dispatch_vp output;
 
-		ret = mshv_pre_guest_mode_work(vp);
-		if (ret)
-			break;
+		if (__xfer_to_guest_mode_work_pending()) {
+			ret = xfer_to_guest_mode_handle_work();
+			if (ret)
+				break;
+		}
 
 		if (vp->run.flags.intercept_suspend)
 			flags |= HV_DISPATCH_VP_FLAG_CLEAR_INTERCEPT_SUSPEND;
-- 
2.51.0.268.g9569e192d0-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
