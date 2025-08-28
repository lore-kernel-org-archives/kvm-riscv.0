Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C118CA0EFF
	for <kvm-riscv@archiver.kernel.org>; Thu, 28 Aug 2025 02:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aWXbTxJFe7/8DxGOUhM+butqJjB7cJlj/Og7dRwEbxc=; b=MPa1Q7F2y6BDzl
	mm76RfhGLnF/9c675PkyYAjsEe4ySjzLPjaR2q7IDp7lgJ/59kBLbCzrcNzV1bU432FLMuEMHffBV
	7nsKFkzsd/wscXlvHG/4w2smpECeDEdWBdrm5rGZH/2p769oWudmcNtWasr5bB/UtwvtPAK6OZl/j
	Y83D47Pxhek/ICH3lEYd4UqIYaPCCTx0kznbQ9icj9ytLIyNmhXP009Oe2MnhCfYjhFb2/Cjefd0v
	rFVhDoh+0Xv2KDU1ZKW4MrMBI7RA/6pOBsZ3vn6htlc2IV9xQHx5wNCVfx2y2bpyN3Ur9UULD135x
	AKInn4bv2qolgma06MIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urSX7-000000002DB-3cey;
	Thu, 28 Aug 2025 02:38:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urQ5l-0000000HIA5-3mxe
	for kvm-riscv@bombadil.infradead.org;
	Thu, 28 Aug 2025 00:02:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=hDymskQNp6wG2uiiMHxVPzsL1nAJPxy4zRxFOrP95kA=; b=pAm0H7XF7u4HKP1z566m1V0QRL
	dfDpreDj6N87VDQrRNAI6cRnobxSudpiKKiampSamT7FTdnpiqgGtnY1uJCjD+eTQYqv84wn6gmbs
	1LUTGErcc6Y6vFH4vuPpPEYh7947lDBOaIILYaOcuAD3xpwRRlMEwuMUkMhpbbUm/hYC3xTrTFtOL
	MiiOTdeWDZIguQb+mb6sLlSi2RawxTlyIDcdm0/Gnc8OYHlnCECvSVYjE8E3F2LUZiEi4rFmUv6nP
	ojgBR7a7AoImFvVFDKIB6v6KQdkwRSRgQr1nOhMdxowXe6Kny4mHuAkvqDvfCiI0F01+IvBf5kzCA
	47ZXhy6w==;
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urQ5f-00000002YCY-3rDf
	for kvm-riscv@lists.infradead.org;
	Thu, 28 Aug 2025 00:02:10 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-327b00af618so64552a91.1
        for <kvm-riscv@lists.infradead.org>; Wed, 27 Aug 2025 17:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756339325; x=1756944125; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=hDymskQNp6wG2uiiMHxVPzsL1nAJPxy4zRxFOrP95kA=;
        b=o7hTOiHnluikvfGx99oJUwa0flvaWnlcRgjtNC4abmgbkXLNDbhY7O2I8/ZPh5a3vI
         3ZYlOLietdBf3ZLzNfy+W4hKvPZppyngs/He2W8z6SEXOqt//wH+UqmnXenONXvZLJGB
         vdGBUjidibuLyb5P4W2b+dmmvV5EubG1pMqasagR0SMc6cEpFodHrZfdDENTrA//zDzv
         Em3S5UXlEsd6FKljIzD96no+nLVh+Amt4rqKLV9MJQjUPOkObt8SKwpB7Nxov4xGbSIc
         N/oVpaa6WGKTfDjrNGN5ZedST7YTN5BnVqFHGEX/gA+QKAudPfGOgFq4Mu41zeOuM/4k
         A6eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756339325; x=1756944125;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hDymskQNp6wG2uiiMHxVPzsL1nAJPxy4zRxFOrP95kA=;
        b=wRCz/d1W/Ct9sRRRq8hJ0RF7CBvMeQol5r2NaLVfEymIfilaTRgiXfgwIi9Xruh9ST
         ammuOD5aJtt0cs/MtQXN/dixYmJa1Lj7AUCYm9YBtatHQNLwDtQoV6IXF26n8VrAorFz
         25o/MFZXDxH7OyfmZPNn6hRLQfWlmr2yV6kLvfIWl2nkVC+rtVQMJcNdtZO+Sw+ookTu
         2nXE3JBKTan1pqoTC4KNlLhGkydwR0jNqC1atmxx09Wa4D+QDm8bOALSIZ7kTCQWleZm
         012OQsm28spmYlwqb2nSBB0vkPK7tyCk4Go8Yno+C89thVwWdL6Q7z8t2WJFWdh+SzPv
         7U4w==
X-Forwarded-Encrypted: i=1; AJvYcCXivxndZGfktkepGKNrjjVPVxQgn6OXCRGBf+c0wYQC03GdXBbeWQ+GMw+8fu+xi5YEm88EbyMq0bo=@lists.infradead.org
X-Gm-Message-State: AOJu0YznMcI5lgdJEj4zLUOSHork6KLPuo8iG4Y9X5euDjskU8x8S448
	LLuU7/BlGG+Z1moE2xXhI51HcEFu26YBaCWdNy+Vfp5c0ESLIZ1PZNywEXHSc1CPsuMpUMuGqcN
	3qle3+w==
X-Google-Smtp-Source: AGHT+IEpldWCysonYjdHETjodWyZtDlIBYcwDxX/6JZFBAIAnGNdK+zSnqMrfXxPLk2m5pFyKQhTG4/yaKw=
X-Received: from pjj15.prod.google.com ([2002:a17:90b:554f:b0:325:833b:6f27])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:55c4:b0:327:aaeb:e814
 with SMTP id 98e67ed59e1d1-327aaebf1b1mr940666a91.23.1756339325323; Wed, 27
 Aug 2025 17:02:05 -0700 (PDT)
Date: Wed, 27 Aug 2025 17:01:51 -0700
In-Reply-To: <20250828000156.23389-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250828000156.23389-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.268.g9569e192d0-goog
Message-ID: <20250828000156.23389-3-seanjc@google.com>
Subject: [PATCH v2 2/7] Drivers: hv: Disentangle VTL return cancellation from SIGPENDING
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
X-CRM114-CacheID: sfid-20250828_010208_074829_0908DA29 
X-CRM114-Status: GOOD (  12.13  )
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

Check for return to a lower VTL being cancelled separately from handling
pending TIF-based work, as there is no need to immediately process pending
work; the kernel will immediately exit to userspace (ignoring preemption)
and handle the pending work at that time.

Disentangling cancellation from the TIF-based work will allow switching to
common virtualization APIs for detecting and processing pending work.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 drivers/hv/mshv_vtl_main.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/hv/mshv_vtl_main.c b/drivers/hv/mshv_vtl_main.c
index 12f5e77b7095..aa09a76f0eff 100644
--- a/drivers/hv/mshv_vtl_main.c
+++ b/drivers/hv/mshv_vtl_main.c
@@ -731,19 +731,21 @@ static int mshv_vtl_ioctl_return_to_lower_vtl(void)
 						_TIF_NOTIFY_RESUME | _TIF_NOTIFY_SIGNAL |
 						_TIF_NEED_RESCHED_LAZY;
 		unsigned long ti_work;
-		u32 cancel;
 		unsigned long irq_flags;
 		struct hv_vp_assist_page *hvp;
 		int ret;
 
 		local_irq_save(irq_flags);
+		if (READ_ONCE(mshv_vtl_this_run()->cancel)) {
+			local_irq_restore(irq_flags);
+			preempt_enable();
+			return -EINTR;
+		}
+
 		ti_work = READ_ONCE(current_thread_info()->flags);
-		cancel = READ_ONCE(mshv_vtl_this_run()->cancel);
-		if (unlikely((ti_work & VTL0_WORK) || cancel)) {
+		if (unlikely(ti_work & VTL0_WORK)) {
 			local_irq_restore(irq_flags);
 			preempt_enable();
-			if (cancel)
-				ti_work |= _TIF_SIGPENDING;
 			ret = mshv_do_pre_guest_mode_work(ti_work);
 			if (ret)
 				return ret;
-- 
2.51.0.268.g9569e192d0-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
