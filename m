Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F17460A2621
	for <kvm-riscv@archiver.kernel.org>; Wed, 28 Oct 2026 19:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BRDjueiS;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nki9NboK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PlVOI/ruW+h0rF+eTmIlRuWDQwhNoapSOX/tG7qeTd0=; b=BRDjueiSJYlh/40Q+ru7TeXlsA
	LtXXbe7Q7q3NtY2I2M3E0H1auZj8wQfDQ5nQ0j9YdQytS8pQGXED/RmnE4vwpobt0zoFoMXYHyheD
	Cw7Ou4OhlcyIUAjm3c7HQ4RTuwOMl1WD3TbU3s1jPiPqzGSjKL6fcFQOiXg5t7qGFxzG8V30TeIjX
	caTXcmW2TgSd51HIEb7/5sFtm8q7VwuQw2pKdyvkbBWWqbgIIgJaIQZMqdkTx7/TVZCDcv/3ySaXL
	hz3+HLTzJsmOdzFJJV3ubSNKo0fr6AoRj1MLGE85UZIszuUpVCfqITHO7uzf0riHXObO4SdLrIulQ
	dFAe2+bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM8vz-00000007oET-3Dt0;
	Wed, 28 Oct 2026 19:03:39 +0000
Received: from mail-pj1-x1046.google.com ([2607:f8b0:4864:20::1046])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM8vX-00000007nZM-3g1U
	for kvm-riscv@lists.infradead.org;
	Wed, 28 Oct 2026 19:03:12 +0000
Received: by mail-pj1-x1046.google.com with SMTP id 98e67ed59e1d1-3ac76132001so1031231a91.0
        for <kvm-riscv@lists.infradead.org>; Wed, 28 Oct 2026 12:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793214191; x=1793818991; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jCCEmu80ia44kI2vyDb6i59VDXRIs93I0WproZ1Xw/A=;
        b=nki9NboKYqDh08ELnKVIwhQbr4z1h8wBKd5PZcwSai4LcJrgeluQ9ONw0FRMTU0uTo
         AJYVqze2qCBLkhk/GkSiWYc4bV9rU+yNXbyYs82Fq1jrP3/8k31mymshTJZIR4LKHomh
         MJukydeRaCP5icsULlNbT8QsAJ7YLlfFlJ2rDu3HAN0XqprAFl5UNYS/BDQ+QcUwjWcY
         5FINNDlIr/nGxKPJ1qWSkTPvR83EIlcfEKsqEb50XJGiwNq7VShHWqdRlSbF8j3I0vCG
         EnH3CQISGnxTgrBIg5Muyxk6bX58ISr51+IRCnInF2SWnAtlgAXghWtUvJvLq40B9c9j
         mITA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793214191; x=1793818991;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jCCEmu80ia44kI2vyDb6i59VDXRIs93I0WproZ1Xw/A=;
        b=uvMVvsW2l/Xl3Y8+Wa1ku8+jgi8eoqSkVftO177HZIFYT2sztgvp00L6uQbW2ldSYC
         U+Ia0rRrMHttQP4Hz5xCjB3ibSd/ow5T57tAwPvxDzqVWZb2O7ARBlmkFY/VMAwVTRg9
         y3anSMve2VxL55LCPOxpYSzJXnq7K+T8nXni78I0950jmJyMIGbLlQfTse/oBvy2JuqW
         Rxl40hbNQyytufvvjF95O9evWFdgVsZG8T/AprjItQWIIPa8N53iQp+9peG26Dfb4qhF
         JocZikX81sm+dVkhDVr0ixvDXccO+RFYfk+x6kjSclQmaQQFXh74zaK6MrKEhTQ9jYj8
         0QuA==
X-Forwarded-Encrypted: i=1; AKwUvByJPx8VkaZBYolB92umzRrgXZibbjWAnO56fPck/cNJz4VtwOTGJFSpH3pQVlfu9nE0v/2T5riu6W4=@lists.infradead.org
X-Gm-Message-State: AFq9FYKpRzPftcmsw7Q6Y4uLhehJGpT/wzfcWDhe4FvlEw3/OJrlWpDY
	l3AT9ANJ5OG9zLNTXv5Y8iTK3K0aFRxyT7TkGw+SUMFUrjZwvJx2eFbIg53q26yuetH2Jbdqsba
	tHU9v7Q==
X-Received: from pghv3.prod.google.com ([2002:a63:f203:0:b0:cd6:b233:e4aa])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4b06:b0:3ab:b64:5893
 with SMTP id 98e67ed59e1d1-3ae581bc654mr2418362a91.53.1793214190430; Wed, 28
 Oct 2026 12:03:10 -0700 (PDT)
Date: Wed, 28 Oct 2026 12:02:59 -0700
In-Reply-To: <20261028190259.1819571-1-seanjc@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261028190259.1819571-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.313.g2479322e68-goog
Message-ID: <20261028190259.1819571-8-seanjc@google.com>
Subject: [PATCH 7/7] KVM: Drop kvm_vcpu_should_kick() and use kvm_request_needs_ipi()
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Nicholas Piggin <npiggin@gmail.com>, 
	Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Stefan Teodorescu <fane@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_120311_918011_8141DE13 
X-CRM114-Status: GOOD (  17.94  )
X-Spam-Score: -9.5 (---------)
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Drop kvm_vcpu_should_kick() in favor of kvm_request_needs_ipi() to fix a
bug where KVM will fail to wait for a vCPU to exit guest mode if the vCPU
was already marked as EXITING_GUEST_MODE by a concurrent non-waiting kick.
Because kvm_vcpu_should_kick() (was kvm_arch_vcpu_should_kick()) only waits
(and sends an IPI to do so) if the target vCPU is fully IN_GUEST_MODE, the
sending task will proceed even though it hasn't actually guaranteed the
vCPU as fully exited the guest.

The flaw is most problematic for SNP VMSA invalidation with in-place gmem
conversion, as KVM invokes kvm_gmem_invalidate_start() => rmp_make_shared()
(via kvm_gmem_make_shared() in quick succession when in-place conversion is
enabled.  I.e. if the target has been marked as EXITING_GUEST_MODE but has
not yet received the other kicker's IPI, then updating the RMP will fail as
the VMSA is still in-use and subsequent accesses to the page will encounter
unexpected RMP #PFs.

Note, the bug exists and affects VMSA invalidation even without in-place
conversion, but is significantly more difficult to hit as PUNCH_HOLE and
.release() have to wade through a lot more code and several locks to get
from invalidation to kvm_gmem_free_folio().

Note #2, currently only x86 uses kvm_make_request_and_kick(), i.e. this is
a glorified nop for all other architectures as the KVM_REQUEST_WAIT path is
never taken.

Fixes: 309d28576f0a ("KVM: SVM: Fix SNP AP destroy race with VMRUN")
Fixes: d1a3c2162334 ("KVM: SEV: Forcefully invalidate SNP VMSA if its backing gmem page is zapped")
Reported-by: Stefan Teodorescu <fane@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index f1792256576b..f99a714698e3 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -191,7 +191,6 @@ void vcpu_put(struct kvm_vcpu *vcpu)
 }
 EXPORT_SYMBOL_FOR_KVM_INTERNAL(vcpu_put);
 
-/* TODO: merge with kvm_vcpu_should_kick */
 static bool kvm_request_needs_ipi(struct kvm_vcpu *vcpu, unsigned req)
 {
 	int mode = kvm_vcpu_exiting_guest_mode(vcpu);
@@ -209,11 +208,6 @@ static bool kvm_request_needs_ipi(struct kvm_vcpu *vcpu, unsigned req)
 	return mode == IN_GUEST_MODE;
 }
 
-static int kvm_vcpu_should_kick(struct kvm_vcpu *vcpu)
-{
-	return kvm_vcpu_exiting_guest_mode(vcpu) == IN_GUEST_MODE;
-}
-
 static void ack_kick(void *_completed)
 {
 }
@@ -3935,7 +3929,7 @@ void __kvm_vcpu_kick(struct kvm_vcpu *vcpu, int req, bool force)
 
 	/*
 	 * Note, the vCPU could get migrated to a different pCPU at any point
-	 * after kvm_vcpu_should_kick(), which could result in sending an
+	 * after kvm_request_needs_ipi(), which could result in sending an
 	 * IPI to the previous pCPU.  But, that's ok because the purpose of the
 	 * IPI is to force the vCPU to leave IN_GUEST_MODE, and migrating the
 	 * vCPU also requires it to leave IN_GUEST_MODE
@@ -3944,7 +3938,7 @@ void __kvm_vcpu_kick(struct kvm_vcpu *vcpu, int req, bool force)
 	 * check also modifies vcpu->mode and KVM PPC needs to avoid that side
 	 * effect for unknown historical reasons.
 	 */
-	if (force || kvm_vcpu_should_kick(vcpu)) {
+	if (force || kvm_request_needs_ipi(vcpu, req)) {
 		cpu = READ_ONCE(vcpu->cpu);
 		if (cpu != me && (unsigned int)cpu < nr_cpu_ids && cpu_online(cpu)) {
 			/*
-- 
2.56.0.313.g2479322e68-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
