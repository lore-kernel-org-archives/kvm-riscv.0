Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA715CA0FED
	for <kvm-riscv@archiver.kernel.org>; Fri,  5 Sep 2025 07:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=y2szFDZKaTdsxNo15Gm5fhhQ13UtcgFqxlOpwV9lWQs=; b=y04nV+IOc3bEdD+03tprty5TGe
	NEOMwZ32O4+3mPpflOYshl2sBITy01mGI6smx99ecnsIYtxl91Bc2Ii7NXy+E/3qJgrHceYoIW6pw
	QvEEb0DgSBxCYpIAtwr426hxepBhdlCdUp8cfUkFkC8NpkkkD9L/G7b2S3bRCHIOyJAi8EKzQOy95
	gW9ao8rEhVicuwG8CTWAwOQdIGytMu+K3K/tqFfMyZywaX7B6FxPtIkGEjeBy/ONrwX4rF1g89C2l
	qndtHiXZnpbaz3ms7hYql7QLhcVnLZW5R5IMg1dI3irQgPNXUSZYmhd3Reo35VTrlDVk+DlyicSKo
	zgGBZn1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuQdm-0000000HW8v-1BAO;
	Fri, 05 Sep 2025 07:13:46 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuPAo-0000000H3Os-1xHa
	for kvm-riscv@lists.infradead.org;
	Fri, 05 Sep 2025 05:39:48 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-32b58eeb874so1686301a91.3
        for <kvm-riscv@lists.infradead.org>; Thu, 04 Sep 2025 22:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757050785; x=1757655585; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3udnh9xsllR+FkjIGPPOo5bX8r6scLid4vmBPD5wmTc=;
        b=zUWO50D3tiM87PviUcIZeXZHpRKLACZowq5urDeMUufJe8NTS2KuH/gppho7SKIqB7
         /YDJ3u8WlYU1zM4jUFyGgoVfLQpLFb08dx52N5maIYS6IO9D9wbmbe+3GdUwX8FNZkzV
         pYeFDn1PCbPTllXIxPJp7TOlhXBXh7ImatvaQmAIvjSkC7uyQ3mWlVPQ3ztuwXv10cbR
         zckgjoyAK213NOjrtVVukE0PgNXdiViELF1ErH6ej+YJkkWOz7a+5IVQHAe4eSqlGfAi
         7NRFLmJePAh6dTzGii8rnF//Kdn5f1ChyJzke/YMVQPkTQ356Gc7GcgmLLRBVNTkd2fn
         Ob/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757050785; x=1757655585;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3udnh9xsllR+FkjIGPPOo5bX8r6scLid4vmBPD5wmTc=;
        b=e06xAzeE7CWbtK9FrG8PoOEzBC8jg3yfV67nvnazHydOXv42Svm0yX5RGBfY9Juz3q
         2icabDzPxqG1ZrI9VYDvFczbb4Dskc3QZCncDjHDH2bHf6lRTvQfD0burhdhaeO2aQ76
         oKBEw3n0Kqi6x/oVPek2e+axjcugmECriQK7bmUvejiB51Zzjmxeo4ehqdI3AXbUVyqh
         Ine83EW0P5ZucBvtxxychayWzbFVOpIE8m8QS4lDQLEANWssYqr6Utb+Krf6830XAotH
         sGAxiMJ41v9MZaqehBv8ipF/yFLUBp02qm5HQgfaFzK9sYhgEdHHmO2kkHTvaXhlO77V
         /hYg==
X-Forwarded-Encrypted: i=1; AJvYcCVwBBtAJluiCNMWwiT1l1rNkutxbojGzH08UCtQghe45J/sxUSQM3j/Uj5rZ3yQcaWsMPrp5kVCrw0=@lists.infradead.org
X-Gm-Message-State: AOJu0YyeHm4wJyhcUAD5buNTdRY7/jezrw7hcY7Ahnyg1JmSY24x+J6U
	PK27GauFPdgdJSRkl+Krk2QHyr0r4kYbq1RhST02CvXko656RMnURFaAYH9CiJHsfzCsETLPKmH
	Bx6NMSw==
X-Google-Smtp-Source: AGHT+IEl3aDxdJxOeFOgsIqqYfLRUExl039yXm0dtHzzby5zYzVGU35ZbpW1dVjZIdU0C50mCLd9IUYMCJw=
X-Received: from pjuw15.prod.google.com ([2002:a17:90a:d60f:b0:325:5e4e:4bd4])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3809:b0:329:dff0:701b
 with SMTP id 98e67ed59e1d1-329dff070c6mr19066965a91.17.1757050784899; Thu, 04
 Sep 2025 22:39:44 -0700 (PDT)
Date: Thu, 4 Sep 2025 22:39:37 -0700
In-Reply-To: <aLojpyTwAMdb1z6D@liuwe-devbox-ubuntu-v2.lamzopl0uupeniq2etz1fddiyg.xx.internal.cloudapp.net>
Mime-Version: 1.0
References: <20250828000156.23389-1-seanjc@google.com> <aLojpyTwAMdb1z6D@liuwe-devbox-ubuntu-v2.lamzopl0uupeniq2etz1fddiyg.xx.internal.cloudapp.net>
Message-ID: <aLp3makY6FzuUwor@google.com>
Subject: Re: [PATCH v2 0/7] Drivers: hv: Fix NEED_RESCHED_LAZY and use common APIs
From: Sean Christopherson <seanjc@google.com>
To: Wei Liu <wei.liu@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, 
	Dexuan Cui <decui@microsoft.com>, Peter Zijlstra <peterz@infradead.org>, 
	Andy Lutomirski <luto@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Frederic Weisbecker <frederic@kernel.org>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Josh Triplett <josh@joshtriplett.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Uladzislau Rezki <urezki@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-hyperv@vger.kernel.org, 
	rcu@vger.kernel.org, Nuno Das Neves <nunodasneves@linux.microsoft.com>, 
	Mukesh R <mrathor@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_223946_516864_B967F922 
X-CRM114-Status: GOOD (  30.47  )
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

On Thu, Sep 04, 2025, Wei Liu wrote:
> On Wed, Aug 27, 2025 at 05:01:49PM -0700, Sean Christopherson wrote:
> > Fix a bug where MSHV root partitions (and upper-level VTL code) don't honor
> > NEED_RESCHED_LAZY, and then deduplicate the TIF related MSHV code by turning
> > the "kvm" entry APIs into more generic "virt" APIs.
> > 
> > This version is based on
> > 
> >   git://git.kernel.org/pub/scm/linux/kernel/git/hyperv/linux.git hyperv-next
> > 
> > in order to pickup the VTL changes that are queued for 6.18.  I also
> > squashed the NEED_RESCHED_LAZY fixes for root and VTL modes into a single
> > patch, as it should be easy/straightforward to drop the VTL change as needed
> > if we want this in 6.17 or earlier.
> > 
> > That effectively means the full series is dependent on the VTL changes being
> > fully merged for 6.18.  But I think that's ok as it's really only the MSHV
> > changes that have any urgency whatsoever, and I assume that Microsoft is
> > the only user that truly cares about the MSHV root fix.  I.e. if the whole
> > thing gets delayed, I think it's only the Hyper-V folks that are impacted.
> > 
> > I have no preference what tree this goes through, or when, and can respin
> > and/or split as needed.
> > 
> > As with v1, the Hyper-V stuff and non-x86 architectures are compile-tested
> > only.
> > 
> > v2:
> >  - Rebase on hyperv-next.
> >  - Fix and converge the VTL code as well. [Peter, Nuno]
> > 
> > v1: https://lore.kernel.org/all/20250825200622.3759571-1-seanjc@google.com
> > 
> 
> I dropped the mshv_vtl changes in this series and applied the rest
> (including the KVM changes) to hyperv-next.

mshv_do_pre_guest_mode_work() ended up getting left behind since its removal was
in the last mshv_vtl patch.

  $ git grep mshv_do_pre_guest_mode_work
  drivers/hv/mshv.h:int mshv_do_pre_guest_mode_work(ulong th_flags);
  drivers/hv/mshv_common.c:int mshv_do_pre_guest_mode_work(ulong th_flags)
  drivers/hv/mshv_common.c:EXPORT_SYMBOL_GPL(mshv_do_pre_guest_mode_work);

Want to squash this into 3786d7d6b3c0 ("mshv: Use common "entry virt" APIs to do
work in root before running guest")?

---
 drivers/hv/mshv.h        |  2 --
 drivers/hv/mshv_common.c | 22 ----------------------
 2 files changed, 24 deletions(-)

diff --git a/drivers/hv/mshv.h b/drivers/hv/mshv.h
index 0340a67acd0a..d4813df92b9c 100644
--- a/drivers/hv/mshv.h
+++ b/drivers/hv/mshv.h
@@ -25,6 +25,4 @@ int hv_call_set_vp_registers(u32 vp_index, u64 partition_id, u16 count,
 int hv_call_get_partition_property(u64 partition_id, u64 property_code,
 				   u64 *property_value);
 
-int mshv_do_pre_guest_mode_work(ulong th_flags);
-
 #endif /* _MSHV_H */
diff --git a/drivers/hv/mshv_common.c b/drivers/hv/mshv_common.c
index eb3df3e296bb..aa2be51979fd 100644
--- a/drivers/hv/mshv_common.c
+++ b/drivers/hv/mshv_common.c
@@ -138,25 +138,3 @@ int hv_call_get_partition_property(u64 partition_id,
 	return 0;
 }
 EXPORT_SYMBOL_GPL(hv_call_get_partition_property);
-
-/*
- * Handle any pre-processing before going into the guest mode on this cpu, most
- * notably call schedule(). Must be invoked with both preemption and
- * interrupts enabled.
- *
- * Returns: 0 on success, -errno on error.
- */
-int mshv_do_pre_guest_mode_work(ulong th_flags)
-{
-	if (th_flags & (_TIF_SIGPENDING | _TIF_NOTIFY_SIGNAL))
-		return -EINTR;
-
-	if (th_flags & (_TIF_NEED_RESCHED | _TIF_NEED_RESCHED_LAZY))
-		schedule();
-
-	if (th_flags & _TIF_NOTIFY_RESUME)
-		resume_user_mode_work(NULL);
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(mshv_do_pre_guest_mode_work);

base-commit: 3786d7d6b3c0a412ebe4439ba4a7d4b0e27d9a12
--

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
