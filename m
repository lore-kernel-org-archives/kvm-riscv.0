Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07623CA1009
	for <kvm-riscv@archiver.kernel.org>; Tue,  2 Sep 2025 21:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=isBCyNSaYNIVtRu8/KG1kPjoEO1gD18aRfEfXJuO6Ik=; b=P/Eq80sfJNg2xB
	J/qZ2TXYJDJhiBvPuCOeZpNs66z8kDUZ0T1mSNSfYHQxOLrJIwx1WDNQUpFBJQyCMWEE1a2gI3X2h
	GOZejRAyGSV/enkQZOr1fDGJtSfIVKmgl/W/hv+TgY5BsNmWguwwn6f3DFEiOb9awP47inHOhRP89
	PwjIcs/YjZt/vj/Ngp8QN2GluQQKCurHnzUCY1uxad8HQYrt51R+O4SPfmQFW5R1FIiCh6dejm8em
	aOj6hFZi5ZudD7Ae9goOVM7QfmvdeQ5JB5JVG1v7PX2lH9Mbg+x4l1835BndjruJxVjP0U+WdberP
	tE13ZVbXYQqQ2nJEzp+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utYn1-00000002BtP-18bJ;
	Tue, 02 Sep 2025 21:43:43 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utT8y-00000000jqq-2mwu;
	Tue, 02 Sep 2025 15:42:02 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1756827718;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rf+ayoYQtVHqsKr2ntB4r4DzbWqKRRg+TboWe56AIXU=;
	b=VyVrqjW0oc/fP+VCKsD3TZex6rjJTdvqEjBbH5z6EsBNG953f0Fzf4PsBLH1Iiftc3v7WN
	CVQNm9FcgNUB+JrhE/mu04u/vIebOAvvq8RqV6ZDA5IGposMcV7KxFRc1aiHWirp0LluXy
	vhygRapmmmZGz3XMSq+BCtyIyzwQkQFEKViJIYIz5c6P9CrMFJHaUTr9RyXF0k8ARF/5E7
	6kptr1XsL31+izs4LBrRZqkEHUrl7DsmstoUK4pi+jTMHucOCz761eW7ADzy3lkncCpG6E
	gXoMmu6HNzjaVxzwYDWWNfJoqlxefgWu+TfvebWun1Yl2hMVr3CcDpI8uJFBVQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1756827718;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rf+ayoYQtVHqsKr2ntB4r4DzbWqKRRg+TboWe56AIXU=;
	b=XeTuImc3Eni7pqznmTyTILIYsXS7DICrATsX80L6vLacqVWb1h+AZnM5XFgxp53qCetuNB
	Ck94LmHJhvb+YXDg==
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Tianrui Zhao
 <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, Huacai Chen
 <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Sean Christopherson <seanjc@google.com>, Paolo
 Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang
 <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, Dexuan Cui
 <decui@microsoft.com>, Peter Zijlstra <peterz@infradead.org>, Andy
 Lutomirski <luto@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>,
 Frederic Weisbecker <frederic@kernel.org>, Neeraj Upadhyay
 <neeraj.upadhyay@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>, Josh
 Triplett <josh@joshtriplett.org>, Boqun Feng <boqun.feng@gmail.com>,
 Uladzislau Rezki <urezki@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-hyperv@vger.kernel.org, rcu@vger.kernel.org, Nuno Das Neves
 <nunodasneves@linux.microsoft.com>, Mukesh R <mrathor@linux.microsoft.com>
Subject: Re: [PATCH v2 5/7] entry: Rename "kvm" entry code assets to "virt"
 to genericize APIs
In-Reply-To: <20250828000156.23389-6-seanjc@google.com>
References: <20250828000156.23389-1-seanjc@google.com>
 <20250828000156.23389-6-seanjc@google.com>
Date: Tue, 02 Sep 2025 17:41:57 +0200
Message-ID: <87tt1kzwsa.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_084200_855564_ED55ECC4 
X-CRM114-Status: UNSURE (   8.02  )
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

On Wed, Aug 27 2025 at 17:01, Sean Christopherson wrote:
> Rename the "kvm" entry code files and Kconfigs to use generic "virt"
> nomenclature so that the code can be reused by other hypervisors (or
> rather, their root/dom0 partition drivers), without incorrectly suggesting
> the code somehow relies on and/or involves KVM.
>
> No functional change intended.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Thomas Gleixner <tglx@linutronix.de>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
