Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83C28CD98C7
	for <kvm-riscv@archiver.kernel.org>; Thu, 11 Jun 2026 19:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=iJ9vzBYW9OXFtp4VJMABFS1zv+lVoJsNTMhjDAQWIrw=; b=3sMnXoM1mntEt4v/40Kj1C8FYn
	HG9B3VM+oSZpT8PxMNoe6I+73WwxFuXPeVS9cNXHQqGSEux075kq1l028VEpiEkhjlzeI4C0AUv0b
	FDDpO4JVjCMYnJoq6ZhDRsp05ILnZ2f8xohrnmtzVqt+Usn+RuR+wShk03Ag44+JIQUv+d6ltPhcu
	DXxKzgYuyPMX1HdkB3GcKs6CxL97x1NzDBJ2zK7pwwdoyIkYjI+03Gc4mmIuEJbzhKKD7XfHLZs2S
	YoWrpU4jYDaqK5dqksLUIMKE0LxKsNVNv1rXnQahPxWF9/jww41dq9Ig6I4n4ga6ya0K2vtVnzWmb
	CIxRenNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXklz-00000009wLj-0DdF;
	Thu, 11 Jun 2026 19:09:03 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXklw-00000009wLQ-1d5t
	for kvm-riscv@lists.infradead.org;
	Thu, 11 Jun 2026 19:09:01 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-2bfdd99f6b7so2884165ad.0
        for <kvm-riscv@lists.infradead.org>; Thu, 11 Jun 2026 12:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781204939; x=1781809739; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6cgKILDAticaRzulsJIYH9W464IRS0YMv9PGXESfrWA=;
        b=BPhYJPi3LZG4cMwZzzrphSO6I7+mOi4FPFaT/WSYfHQ4clcc96+M0Be/CVmtfTqfNI
         IHdr1BTnPEvggb1B6RwIKw6S6wvXsA3sE7P2U+7F+UQ13nPhw4CrFSh+Gn5APyHxoSPl
         ii8dZKkHsymr+TU02BJAnd7nigghKcG5nEkyQ6VwWM+EOZ64bVRYiPPDkNpKdKmTJAn0
         XNEzBUs1jqVlRccQUMx2vs6In1o/i0TCABz/U3ZSKQDSCTy1fOic2uQgeW6wY3pJOcuN
         mcmTzf5bW20z0RZdU5F6uMFdogk3IepBoTHbKa8VYBCY1xwAYSrepdYj8KZgRb5/jPsp
         qMCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781204939; x=1781809739;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6cgKILDAticaRzulsJIYH9W464IRS0YMv9PGXESfrWA=;
        b=mObEKSCu46piby1i8VrbSTdPmMpdSi+X3wqYJ1rS/TC38/3tUJLWJ3YvogsUc3puiQ
         zk/Y01h/mmBI+bIUZeUmsKg4Oqg4Nb3GPLoFPV3jVsPQYB3Ke9P6WkCne25k2eppPW7O
         GK8V7Y2dUIyfJ7UCc1CE990sYS1L6Eb6fWSy69HiwL5Km5mrznawOnzHg4cmVCv9yOFh
         P9h/70ZTBLTc4iiygh2e7T1kIcXbOCWHryDE9VQ/h+pJMQuS6br+EXICI+fNbKsavCS3
         xR3FTi4tc2jHLJtKUT7K7boTBX/YqpnnWjrH0W5e5XATuQb5Aw+6tyn4m99gdxk7ChCi
         qV1Q==
X-Forwarded-Encrypted: i=1; AFNElJ8tzhmp+z6l2X9c/Ey97QFaJ6gs5B1+85aKn4Cn7glYc5C2nIWyTeePuexDt+jhSrIZe4/+xZK5Ev4=@lists.infradead.org
X-Gm-Message-State: AOJu0YwphX3Pa+kcfBLX9mHibwXe++Ws0wuSJ8OHzkoaFtt+N39zRUUb
	MlpszYVsW4wjZnbLg8yMx2lbXxCUYXItJfksta8kScz7O2CmA9bcBPh8lbQKUZAh+OKL1Yh9GdS
	C4goS3Q==
X-Received: from plkn7.prod.google.com ([2002:a17:902:6a87:b0:2bf:10b7:41d7])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:cccd:b0:2c0:c262:b917
 with SMTP id d9443c01a7336-2c2f0059f43mr46929825ad.5.1781204938424; Thu, 11
 Jun 2026 12:08:58 -0700 (PDT)
Date: Thu, 11 Jun 2026 12:08:57 -0700
In-Reply-To: <CAEvNRgGrPKBXh=VA3QBLJOczKRpMOB4nDmZL0XRwV6B3PT_7+Q@mail.gmail.com>
Mime-Version: 1.0
References: <20260331194202.1722082-1-vipinsh@google.com> <20260331194202.1722082-2-vipinsh@google.com>
 <CAEvNRgGrPKBXh=VA3QBLJOczKRpMOB4nDmZL0XRwV6B3PT_7+Q@mail.gmail.com>
Message-ID: <aisHySKe0PwM5DSg@google.com>
Subject: Re: [PATCH v4 1/9] KVM: selftest: Create KVM selftest runner
From: Sean Christopherson <seanjc@google.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: Vipin Sharma <vipinsh@google.com>, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, pbonzini@redhat.com, borntraeger@linux.ibm.com, 
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, anup@brainfault.org, 
	atish.patra@linux.dev, zhaotianrui@loongson.cn, maobibo@loongson.cn, 
	chenhuacai@kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	ajones@ventanamicro.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_120900_427845_EA9B1376 
X-CRM114-Status: UNSURE (   8.93  )
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

On Wed, Jun 10, 2026, Ackerley Tng wrote:
> Vipin Sharma <vipinsh@google.com> writes:
> My (future) use case is that with hugepages, I want to run something
> like
> 
>   ./guest_memfd_test --order=0
>   ./guest_memfd_test --order=9
>   ./guest_memfd_test --order=18
> 
> And 0, 9 and 18 are the supported HugeTLB orders on the machine being
> tested. I'd like to iterate over supported HugeTLB orders at runner
> runtime instead of at build time.

No.  The right way to handle this is to define testcases for the "interesting"
sizes, and then rely on the test itself to SKIP if the size is unsupported.  This
is no different than a test that requires EPT, or nested VMX, or nested SVM, etc.

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
