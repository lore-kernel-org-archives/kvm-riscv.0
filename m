Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57B72C982E6
	for <kvm-riscv@archiver.kernel.org>; Mon, 21 Sep 2026 17:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gdNZMcycfid5Lv7WgHXbGLF/yk+eQCuRtWdHe+OXGf4=; b=A9TpXinwlWIVfZ
	UgyeR6P0o4zhoA0nJHKri55sasNwbfT+uqIgW0Fsw3cBcYxTVuMbW6OACN4lXgnW/NCrUBcsS0sRi
	6a/Hj7k7RavLKf09zjdppLFH8zjo8Fb1j6OufTU/Pvn9lo+wSQAqbW74Hr5wFmHPWnMMJ3ApYSgaZ
	XUcAScJdONguvWngSMfKNjdhKL0NYtBpzfnl9qjzQtkaJ9jEprLLzhkcCXSb3AUw6vXONGTH5HYkw
	aDH30DoCtA3rmqdRgkyTtqSSvpmkyAiZUnszuyPD+BoAfp8jiLeAuUYXBaluHFeRSdDMU/giG8CdF
	vlk3+pZGTLNBAGFREcbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8i4e-000000031nn-3sMb;
	Mon, 21 Sep 2026 17:45:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8i4b-000000031iD-1ouS
	for kvm-riscv@bombadil.infradead.org;
	Mon, 21 Sep 2026 17:45:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=YYqX0VJzWkRuy7Rww/xIfxaxsSEw1uv9+hGx8/FiNWw=; b=N+ldkXD54WG4qN7uPTj/6sNDWa
	NBOJYf4pfKTDenw6AsSt5P85NWz68XRswL5IO8xatjgOl7svpotDFiZq3MCaPN7BnB1Y9IlogW+cQ
	dqFn4HBj9mRFwuLjn2Ty3TPfJwj2zrbt1I/XXzxK2g5cxAWr8hXNhIbylBHK3xIU/DNGgIN1XLAJx
	ef6HO9WkKEBqPgdXcXgYvC9ubOF1BXUPQDEgOOlcDIgfeUKxxGfUlX1FlrckeaMWpFjXDFmtZw5eB
	IMBBeiwher3ICeOrRrwrkEJY1Bga8QHHXRHg80IXwTBDXeTr4iJbgU3yXJ9LtcimhxkM9CXIh+pqR
	0zQi8wuw==;
Received: from mail-pj1-x1047.google.com ([2607:f8b0:4864:20::1047])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8i4Y-0000000CdsU-2y3K
	for kvm-riscv@lists.infradead.org;
	Mon, 21 Sep 2026 17:45:00 +0000
Received: by mail-pj1-x1047.google.com with SMTP id 98e67ed59e1d1-3823dcc1647so4522566a91.3
        for <kvm-riscv@lists.infradead.org>; Mon, 21 Sep 2026 10:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790012696; x=1790617496; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YYqX0VJzWkRuy7Rww/xIfxaxsSEw1uv9+hGx8/FiNWw=;
        b=aVjEB0tRJpRSn7vfca6pMabbOo2O+7XmG05UVWoq94Zv/+U6yM51Yfy+WhpUV+s/QB
         PhcoHkL+kt4LpLw7H7myN793Zfw8wrftf157XdS0IB93WVv6BTiyNhRpVxgnDMjKbTg4
         T2SOdFT//U0t36bualq+AYXnCvUoopydJIucOXmCJXy0d3SXE5U60NR90Bg9tBCvTOOi
         eGEnu2e2otD1LTkQl5o+VkO5wt091ugl5XCBPiyzGYaMHTyrd+zXrtyXTBZac1YLGSEv
         aMvdHS7bOdlOxK9dSHWC+LOghkzAVf0vvyAdLFfxIo/JjrF8GjnUGrV3tzxFJ7Uv8Aro
         T6Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790012696; x=1790617496;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YYqX0VJzWkRuy7Rww/xIfxaxsSEw1uv9+hGx8/FiNWw=;
        b=wx724qTmk+prLuwWsnJKfEXmMATA1CHbVJew3q17bMUGIr5Mowvfz5STva5ge0d0zy
         K/5OqMVMq/qMCJj37dAgOpDpfZ3niTk2OCqBfRdVbwhwiNLPASRqUKbT3an6lw+D4JCt
         xcfx623iLMlXK7kurdH3YSpBsXokoc1laLHgPOX60V/nNM5ojS5rOC9rgxdIxgIwLwPd
         BN2leI7N5oKTNtQ7l40pe+yOxCsxT8Ni+5Af1+1i5Yz0hjnMYit5MU5GmfJC0k4ODwOL
         ggkeacycZzYYSSCIygV0KKhgDQLPnUcJHr8yz7CBMRLwiNHwq3A9zRO0WfN1LpmBiqLn
         nBSA==
X-Forwarded-Encrypted: i=1; AKwUvBx3d+ORYcMcD3cYKMf7O7QjhIWLWWMdlDmBskEGZClcx7wQnGrGLiXg+ko3m6UlYXczcg0kG/2Bm0I=@lists.infradead.org
X-Gm-Message-State: AFuF++kFKwF8l9t072Z/VBsU9OuwLHJmMvfl3XQeNGO+XfPJbpNjMLJx
	u2qdRyyKdy3Fa/LsdK/xba8nW1kPYUihOsvBZweAAgbBu7eJ9tP+dLl0auZ8ZPDY7Xmm2YoBgLR
	WmAPB4g==
X-Received: from pjro5.prod.google.com ([2002:a17:90a:b885:b0:3a0:645b:1c57])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:d888:b0:39e:4c7f:8b16
 with SMTP id 98e67ed59e1d1-39e54cf8bdbmr17922638a91.27.1790012695572; Mon, 21
 Sep 2026 10:44:55 -0700 (PDT)
Date: Mon, 21 Sep 2026 10:44:45 -0700
In-Reply-To: <20260921174445.911676-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260921174445.911676-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260921174445.911676-8-seanjc@google.com>
Subject: [PATCH v2 7/7] KVM: WARN if vCPU creation is in-progress when locking
 all vCPUs
From: Sean Christopherson <seanjc@google.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: Nicholas Piggin <npiggin@gmail.com>, Atish Patra <atish.patra@linux.dev>, 
	Alexandre Ghiti <alex@ghiti.fr>, Dave Hansen <dave.hansen@linux.intel.com>, 
	linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	x86@kernel.org, linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Jean-Christophe Guillain <jean-christophe@guillain.net>, 
	"=?UTF-8?q?Pawe=C5=82=20S?=" <spawel523@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_184458_860266_F3576C75 
X-CRM114-Status: UNSURE (   9.26  )
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

Now that KVM holds kvm->lock for the entirety of vCPU creation, from when
created_vcpus is incremented until the new vCPU is fully onlined, WARN if
the impossible happens and KVM somehow sees a discrepancy between the
number of vCPUs "created" and "onlined".

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 985af39b980a..e66d9761ee49 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -1363,7 +1363,7 @@ int kvm_trylock_all_vcpus(struct kvm *kvm)
 
 	lockdep_assert_held(&kvm->lock);
 
-	if (kvm_is_vcpu_creation_in_progress(kvm))
+	if (WARN_ON_ONCE(kvm_is_vcpu_creation_in_progress(kvm)))
 		return -EBUSY;
 
 	kvm_for_each_vcpu(i, vcpu, kvm)
@@ -1389,7 +1389,7 @@ int kvm_lock_all_vcpus(struct kvm *kvm)
 
 	lockdep_assert_held(&kvm->lock);
 
-	if (kvm_is_vcpu_creation_in_progress(kvm))
+	if (WARN_ON_ONCE(kvm_is_vcpu_creation_in_progress(kvm)))
 		return -EBUSY;
 
 	kvm_for_each_vcpu(i, vcpu, kvm) {
-- 
2.55.0.1082.g2b9226bbc0-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
