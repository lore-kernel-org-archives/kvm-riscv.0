Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB707C3ABAA
	for <kvm-riscv@archiver.kernel.org>; Fri,  2 May 2025 21:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=MOiPVYU7U/GZ8Ayu4VJV24+te0lYOQK6ilvQckEdA+M=; b=lZS/OvhCXCf6N0y7zvr1vWDEK/
	xUm5T3a/QKRzmekPa0tTBAN4mtt1sFn6P5APJpkHAX/XNHhE0qudRbKIjNRiBXD+k9RPeGqQbwZBg
	A/4RPhnZxsZxTx3bVq5HIWhIV5WZixspugbcXgDTrv1R9cUOmG6h0aluGyj1N2E67/67R26lP/DPd
	mbEU1OX2FKf01Gxigfybp35JHuvGj6D+jWodX2kOHvceFOxxNwC/XP0rr1FdR1fWWtXDtPpN0Zj5s
	focZVL7EqXS16vGyKBGdYLme5pElGVX6p++kox/JqXw/nC9HcIusKsKdF7LH53+tC2p6mswkOfnPW
	WWTQzQEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAxXm-000000031gF-1N9M;
	Fri, 02 May 2025 21:03:38 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAxRc-000000030wO-3Gth
	for kvm-riscv@lists.infradead.org;
	Fri, 02 May 2025 20:57:18 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-af9564001cbso1598155a12.3
        for <kvm-riscv@lists.infradead.org>; Fri, 02 May 2025 13:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746219435; x=1746824235; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZjfhxP1aTkCqZKrd23sK3YHNUgKYVqxJbIVvYWHW5Vg=;
        b=CCO0UPAPEcW1FhpcdnqRa/5QVFCgirASa6Jiwx4U9bD+Vp3KjzJHRXyCHT2n/it0Mb
         r6nI1POCp3MEP/XmbhiUMxa7MWUyZ5o5Eo5+J1n7rFFEwTKuscqdNmEOa9R/ugI8XG9b
         N1JIV6e/PEd6Xui6QqpZWOIf+pgAmQMGSKopXrX0Wph015simffST1YfhI8QILPUFseu
         +jau8kiCVA9TnGeQA74LFT8b1DedWRtsv80TY4GxmjT+YlzI9JAJPVTzvylZr6eOntgU
         q5hbDR73pKU+Xn3fprfCU5ecG/aVVAVY040rQAl+uhAcrr9zxGZH+Fs/sJP2P6f2os0L
         9T9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746219435; x=1746824235;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZjfhxP1aTkCqZKrd23sK3YHNUgKYVqxJbIVvYWHW5Vg=;
        b=Y5J6pAP95yivh39j1IdwyhwI/dpegts1VB5bDVguUwF4vHNOAnJvMJGKsBp4XrjiSW
         uz3q+fpOJr1Jmz1P82Dwzeb+L8M35eWIkz7pQWrkhZCN1qbYx40KQ0qSb3rkX6AC6Mbx
         0piL74t9WC68Ss2g39a1cD6Zm9GcrIRQLdisr+qiWsB97US8ZoCmJV2OWzTMdt1MqOo6
         3LpCLw5reIjg3tV+lzV/7ELA2bX2k3UpWx42Mqyo7fBSS4a/rzdLT+IG8h1shn31IUQu
         F80QZHfL5PBOya/z/CqpsFx1EI77fdC4meDoHi6a2MnA44B6ngdo3mtQnpdH4V60ZbZL
         +C8g==
X-Forwarded-Encrypted: i=1; AJvYcCXyWhW3aj9IOLLl6XVCAZudiJJPrVbcnRZjZwynquntqA+3VGKTTMjGPTAT65P9XOYV23byPf8/l18=@lists.infradead.org
X-Gm-Message-State: AOJu0YzBn7v/I6UcTe4G8DEvvm6IxMo5caF48jiFj9YTSFnAJtaUVnQK
	Z/mdYzdU7DDrQZ6MWUdgXrQj8KFZPYT9Mru3SmQ1uOYixzLu4JJOdLHXlYcLwLq1lmPUIBt7u5+
	EqQ==
X-Google-Smtp-Source: AGHT+IFuPDTKjcdWvbnOJrt3XOUZC4A4co+KVYAa4VIdQzxs3SS2Bb249oxqj85YoS9Ls6YyYG5MsQtlc4s=
X-Received: from pjbqb9.prod.google.com ([2002:a17:90b:2809:b0:2f5:63a:4513])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2f0e:b0:2ff:618c:a1e0
 with SMTP id 98e67ed59e1d1-30a4e6b2624mr6211245a91.29.1746219435414; Fri, 02
 May 2025 13:57:15 -0700 (PDT)
Date: Fri, 2 May 2025 13:57:13 -0700
In-Reply-To: <20250430203013.366479-6-mlevitsk@redhat.com>
Mime-Version: 1.0
References: <20250430203013.366479-1-mlevitsk@redhat.com> <20250430203013.366479-6-mlevitsk@redhat.com>
Message-ID: <aBUxqZ6qgfYZLsye@google.com>
Subject: Re: [PATCH v4 5/5] x86: KVM: SEV: implement kvm_lock_all_vcpus and
 use it
From: Sean Christopherson <seanjc@google.com>
To: Maxim Levitsky <mlevitsk@redhat.com>
Cc: kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Kunkun Jiang <jiangkunkun@huawei.com>, Waiman Long <longman@redhat.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Borislav Petkov <bp@alien8.de>, Albert Ou <aou@eecs.berkeley.edu>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Alexander Potapenko <glider@google.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Andre Przywara <andre.przywara@arm.com>, x86@kernel.org, Joey Gouly <joey.gouly@arm.com>, 
	Thomas Gleixner <tglx@linutronix.de>, kvm-riscv@lists.infradead.org, 
	Atish Patra <atishp@atishpatra.org>, Ingo Molnar <mingo@redhat.com>, 
	Jing Zhang <jingzhangos@google.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, kvmarm@lists.linux.dev, 
	Will Deacon <will@kernel.org>, Keisuke Nishimura <keisuke.nishimura@inria.fr>, 
	Sebastian Ott <sebott@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Shusen Li <lishusen2@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Randy Dunlap <rdunlap@infradead.org>, Marc Zyngier <maz@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_135716_814613_AED1DB29 
X-CRM114-Status: GOOD (  15.18  )
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

On Wed, Apr 30, 2025, Maxim Levitsky wrote:
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 834f08dfa24c..9211b07b0565 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -1392,6 +1392,31 @@ int kvm_trylock_all_vcpus(struct kvm *kvm)
>  }
>  EXPORT_SYMBOL_GPL(kvm_trylock_all_vcpus);
>  
> +/*
> + * Lock all of the VM's vCPUs.
> + * Assumes that the kvm->lock is held.

Add a lockdep assertion instead of a comment.

> + * Returns -EINTR if the process is killed.
> + */
> +int kvm_lock_all_vcpus(struct kvm *kvm)
> +{
> +	struct kvm_vcpu *vcpu;
> +	unsigned long i, j;
> +
> +	kvm_for_each_vcpu(i, vcpu, kvm)

Needs curly braces.

> +		if (mutex_lock_killable_nest_lock(&vcpu->mutex, &kvm->lock))

I'd rather return mutex_lock_killable_nest_lock()'s error code verbatim.  Then
the function comment can go away, because the only thing remaining would be:

	/*
	 * Lock all of the VM's vCPUs.
	 /*

and that should be completely self-explanatory.  E.g.

int kvm_lock_all_vcpus(struct kvm *kvm)
{
	struct kvm_vcpu *vcpu;
	unsigned long i, j;
	int r;

	lockdep_assert_held(&kvm->lock);

	kvm_for_each_vcpu(i, vcpu, kvm) {
		r = mutex_lock_killable_nest_lock(&vcpu->mutex, &kvm->lock);
		if (r)
			goto out_unlock;
	}
	return 0;

out_unlock:
	kvm_for_each_vcpu(j, vcpu, kvm) {
		if (i == j)
			break;
		mutex_unlock(&vcpu->mutex);
	}
	return r;
}
EXPORT_SYMBOL_GPL(kvm_lock_all_vcpus);

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
