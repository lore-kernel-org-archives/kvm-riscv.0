Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D31CC36002
	for <kvm-riscv@archiver.kernel.org>; Wed,  9 Apr 2025 14:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:MIME-Version:
	Date:Message-ID:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qpVmULiwGbLOweGaHjU0lNZknw82A4rjlvjdzVqECXM=; b=FP/N5k67PG2rk0hq276ryWjny4
	YJ/cO2eFCOP1Kewhj3zGxrxMvUI58qDdFrYlBJ57kyekwEfpd3qoX1oPOsI4w3uPlO7avE0Awkf+M
	hva7Y4fWEJQBVNFQi9A2eO45WmJ/ukzpSE99ozssGg8HH6OQ3dukASI235/7DFAx6G3QSWBNgNN0t
	MrVvZj5x2V0d0MOsO/lXw67mtJ/DvlWa0AbhiDMz02vKOSOZteD+RnOu9K473Hkj6n45IO5Sodma2
	pXxyu9Uq33+mmYj4sC93TACGvFSc6B0fmxXxNlHSuuGAXBxXrWI8gTz1ztLx37OcWL9gvumg4Q15G
	R6LejGEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2WZQ-00000007UIb-34i1;
	Wed, 09 Apr 2025 14:38:28 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Vm1-00000007LU5-3VNF
	for kvm-riscv@lists.infradead.org;
	Wed, 09 Apr 2025 13:47:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744206443;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C8sFG62uIhWcCDnsK+TitF7g9YvTTNhbdnhc8bS11xU=;
	b=KznMxwoThhqld6k4O5l3Rvg/uSWdZLhldqbPFbrRszXi3ldXZnNCTKURNu1IdgMHkHJUjM
	oQg8pVOXjU3s6g5jLJiLmUezE9WA2sZYpokAlu5Vna+b1FPlsLLu3GwrwKFzy8SHl1TzYP
	jXvftE7eIzDpz985nQXZ/Ix+zDS8Lkk=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-589-2rufv5riO5eEimNKDx3EQQ-1; Wed, 09 Apr 2025 09:47:19 -0400
X-MC-Unique: 2rufv5riO5eEimNKDx3EQQ-1
X-Mimecast-MFC-AGG-ID: 2rufv5riO5eEimNKDx3EQQ_1744206436
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3d4423d0c49so62983695ab.0
        for <kvm-riscv@lists.infradead.org>; Wed, 09 Apr 2025 06:47:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744206436; x=1744811236;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C8sFG62uIhWcCDnsK+TitF7g9YvTTNhbdnhc8bS11xU=;
        b=v4FVjUsIgQd8jUupsPe2p3yAEQwge9N8oxLOVSD9bP/R4hx4KX9Zequ45hGLgT2k0z
         GIQieYMaqBHxy6d2kJCDIy79zH7xXYK7s52vyHUKGD86jF9y/YZwZXl17C4CmyYCEmZC
         vL0GugUcxGH5wpgZ5dTakirkkIHbCMbk/ryLqMgs0g/BgJixC1gTGAVfge90tj6MjAti
         OhekLwjBiTV+x6yy7IZ2XWZYgG8/Dqkc9gYTUnYJAq9cz6vkGnhrg1ysjtnD16EHvL+q
         hZNZFEnvsxU2bODbMy66iMBajyHmtEcWh6JyMCx0WGJiFdhJGydpj/C7XuRJiPysjgWc
         nqVg==
X-Forwarded-Encrypted: i=1; AJvYcCXdzkPvNhH+ZyqVCPLTYrcLm99+kRfqu/OmQTn1SOrwq76r64EHu65Fh/ZlXiNtFhpQQ47hlaLPwQk=@lists.infradead.org
X-Gm-Message-State: AOJu0YwuSajzSKp8Va7wP111L+VNzdxYpXFRONA76bW41fP49Pbmctiy
	cUxl+2WNeRloGVgC+L2QH9d5SHzL6sMuduseyFvMV2a2XOqGCNi2YAB9vVkJPqq1JBhsJTLvXsb
	CC46rueN0y/o5Fk0G14jZNuccuTNce37JJ1YtC7eeZVqHAeu5wJR/WBrRNf2nh2I=
X-Gm-Gg: ASbGncuY4GZTjc4SQOhmghEQ0n3tlsn1s1GszKVQL+Y0vD4jGiGNVz6AAeQuI2fKyUm
	iYkMA6WZJbNZHcfvB/gvAxtiXWRthRwQcFIgP23lwf4z9yjgMCQ+fThIfONZ45ge+YaAs3XzJdK
	Z+CII4ABDqbxbJiZOTnVfUvVW0VaDPmZIg85nxS1g9WvtTiQtKtRnn+7ULZicO+6OGg8x3/B621
	Bg31ZDWvJf7bZVZL0k8X1RtYFO/YSlSfoUMy3Slh9l+UEXymltbflz+zQaGcADsZKG8ayo7YvD7
	ALcnUpqxJawrKPr5ZVKSnjlHyhmxE3DXRY2flrNtaWS3Z9vn5QG5V/LTGQ==
X-Received: by 2002:a05:6e02:1c0e:b0:3d5:dec0:7c03 with SMTP id e9e14a558f8ab-3d77c27fb00mr27400505ab.12.1744206436326;
        Wed, 09 Apr 2025 06:47:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGY11cU0INBe/qnf4e7hQqyG5TAgNSTBjToXX6S3PDZH7tI5Cb3FdlfnkGTFvFeZrlBBTdq0A==
X-Received: by 2002:a05:6e02:1c0e:b0:3d5:dec0:7c03 with SMTP id e9e14a558f8ab-3d77c27fb00mr27400065ab.12.1744206435834;
        Wed, 09 Apr 2025 06:47:15 -0700 (PDT)
Received: from ?IPV6:2601:188:c100:5710:315f:57b3:b997:5fca? ([2601:188:c100:5710:315f:57b3:b997:5fca])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d7dba85487sm2698105ab.23.2025.04.09.06.47.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 06:47:15 -0700 (PDT)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <b0fe0707-faae-4e0b-b873-9a80e39471fc@redhat.com>
Date: Wed, 9 Apr 2025 09:47:11 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] KVM: x86: move sev_lock/unlock_vcpus_for_migration
 to kvm_main.c
To: Maxim Levitsky <mlevitsk@redhat.com>, kvm@vger.kernel.org
Cc: Alexander Potapenko <glider@google.com>, "H. Peter Anvin"
 <hpa@zytor.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 kvm-riscv@lists.infradead.org, Oliver Upton <oliver.upton@linux.dev>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Jing Zhang <jingzhangos@google.com>, x86@kernel.org,
 Kunkun Jiang <jiangkunkun@huawei.com>, Boqun Feng <boqun.feng@gmail.com>,
 Anup Patel <anup@brainfault.org>, Albert Ou <aou@eecs.berkeley.edu>,
 kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org,
 Zenghui Yu <yuzenghui@huawei.com>, Borislav Petkov <bp@alien8.de>,
 Alexandre Ghiti <alex@ghiti.fr>,
 Keisuke Nishimura <keisuke.nishimura@inria.fr>,
 Sebastian Ott <sebott@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Atish Patra <atishp@atishpatra.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Randy Dunlap <rdunlap@infradead.org>,
 Will Deacon <will@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, Marc Zyngier <maz@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Joey Gouly <joey.gouly@arm.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Andre Przywara <andre.przywara@arm.com>, Thomas Gleixner
 <tglx@linutronix.de>, Sean Christopherson <seanjc@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Bjorn Helgaas <bhelgaas@google.com>
References: <20250409014136.2816971-1-mlevitsk@redhat.com>
 <20250409014136.2816971-3-mlevitsk@redhat.com>
In-Reply-To: <20250409014136.2816971-3-mlevitsk@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0Y6X0P9Bqbg2w-o_TmO9d3RR-VGlMGKBjATSaoIjLW8_1744206436
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_064725_983412_36C2A8F8 
X-CRM114-Status: GOOD (  27.05  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org


On 4/8/25 9:41 PM, Maxim Levitsky wrote:
> Move sev_lock/unlock_vcpus_for_migration to kvm_main and call the
> new functions the kvm_lock_all_vcpus/kvm_unlock_all_vcpus
> and kvm_lock_all_vcpus_nested.
>
> This code allows to lock all vCPUs without triggering lockdep warning
> about reaching MAX_LOCK_DEPTH depth by coercing the lockdep into
> thinking that we release all the locks other than vcpu'0 lock
> immediately after we take them.
>
> No functional change intended.
>
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
> ---
>   arch/x86/kvm/svm/sev.c   | 65 +++---------------------------------
>   include/linux/kvm_host.h |  6 ++++
>   virt/kvm/kvm_main.c      | 71 ++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 81 insertions(+), 61 deletions(-)
>
> diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
> index 0bc708ee2788..7adc54b1f741 100644
> --- a/arch/x86/kvm/svm/sev.c
> +++ b/arch/x86/kvm/svm/sev.c
> @@ -1889,63 +1889,6 @@ enum sev_migration_role {
>   	SEV_NR_MIGRATION_ROLES,
>   };
>   
> -static int sev_lock_vcpus_for_migration(struct kvm *kvm,
> -					enum sev_migration_role role)
> -{
> -	struct kvm_vcpu *vcpu;
> -	unsigned long i, j;
> -
> -	kvm_for_each_vcpu(i, vcpu, kvm) {
> -		if (mutex_lock_killable_nested(&vcpu->mutex, role))
> -			goto out_unlock;
> -
> -#ifdef CONFIG_PROVE_LOCKING
> -		if (!i)
> -			/*
> -			 * Reset the role to one that avoids colliding with
> -			 * the role used for the first vcpu mutex.
> -			 */
> -			role = SEV_NR_MIGRATION_ROLES;
> -		else
> -			mutex_release(&vcpu->mutex.dep_map, _THIS_IP_);
> -#endif
> -	}
> -
> -	return 0;
> -
> -out_unlock:
> -
> -	kvm_for_each_vcpu(j, vcpu, kvm) {
> -		if (i == j)
> -			break;
> -
> -#ifdef CONFIG_PROVE_LOCKING
> -		if (j)
> -			mutex_acquire(&vcpu->mutex.dep_map, role, 0, _THIS_IP_);
> -#endif
> -
> -		mutex_unlock(&vcpu->mutex);
> -	}
> -	return -EINTR;
> -}
> -
> -static void sev_unlock_vcpus_for_migration(struct kvm *kvm)
> -{
> -	struct kvm_vcpu *vcpu;
> -	unsigned long i;
> -	bool first = true;
> -
> -	kvm_for_each_vcpu(i, vcpu, kvm) {
> -		if (first)
> -			first = false;
> -		else
> -			mutex_acquire(&vcpu->mutex.dep_map,
> -				      SEV_NR_MIGRATION_ROLES, 0, _THIS_IP_);
> -
> -		mutex_unlock(&vcpu->mutex);
> -	}
> -}
> -
>   static void sev_migrate_from(struct kvm *dst_kvm, struct kvm *src_kvm)
>   {
>   	struct kvm_sev_info *dst = to_kvm_sev_info(dst_kvm);
> @@ -2083,10 +2026,10 @@ int sev_vm_move_enc_context_from(struct kvm *kvm, unsigned int source_fd)
>   		charged = true;
>   	}
>   
> -	ret = sev_lock_vcpus_for_migration(kvm, SEV_MIGRATION_SOURCE);
> +	ret = kvm_lock_all_vcpus_nested(kvm, false, SEV_MIGRATION_SOURCE);
>   	if (ret)
>   		goto out_dst_cgroup;
> -	ret = sev_lock_vcpus_for_migration(source_kvm, SEV_MIGRATION_TARGET);
> +	ret = kvm_lock_all_vcpus_nested(source_kvm, false, SEV_MIGRATION_TARGET);
>   	if (ret)
>   		goto out_dst_vcpu;
>   
> @@ -2100,9 +2043,9 @@ int sev_vm_move_enc_context_from(struct kvm *kvm, unsigned int source_fd)
>   	ret = 0;
>   
>   out_source_vcpu:
> -	sev_unlock_vcpus_for_migration(source_kvm);
> +	kvm_unlock_all_vcpus(source_kvm);
>   out_dst_vcpu:
> -	sev_unlock_vcpus_for_migration(kvm);
> +	kvm_unlock_all_vcpus(kvm);
>   out_dst_cgroup:
>   	/* Operates on the source on success, on the destination on failure.  */
>   	if (charged)
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index 1dedc421b3e3..30cf28bf5c80 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -1015,6 +1015,12 @@ static inline struct kvm_vcpu *kvm_get_vcpu_by_id(struct kvm *kvm, int id)
>   
>   void kvm_destroy_vcpus(struct kvm *kvm);
>   
> +int kvm_lock_all_vcpus_nested(struct kvm *kvm, bool trylock, unsigned int role);
> +void kvm_unlock_all_vcpus(struct kvm *kvm);
> +
> +#define kvm_lock_all_vcpus(kvm, trylock) \
> +	kvm_lock_all_vcpus_nested(kvm, trylock, 0)
> +
>   void vcpu_load(struct kvm_vcpu *vcpu);
>   void vcpu_put(struct kvm_vcpu *vcpu);
>   
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 69782df3617f..71c0d8c35b4b 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -1368,6 +1368,77 @@ static int kvm_vm_release(struct inode *inode, struct file *filp)
>   	return 0;
>   }
>   
> +
> +/*
> + * Lock all VM vCPUs.
> + * Can be used nested (to lock vCPUS of two VMs for example)
> + */
> +int kvm_lock_all_vcpus_nested(struct kvm *kvm, bool trylock, unsigned int role)
> +{
> +	struct kvm_vcpu *vcpu;
> +	unsigned long i, j;
> +
> +	lockdep_assert_held(&kvm->lock);
> +
> +	kvm_for_each_vcpu(i, vcpu, kvm) {
> +
> +		if (trylock && !mutex_trylock_nested(&vcpu->mutex, role))
> +			goto out_unlock;
> +		else if (!trylock && mutex_lock_killable_nested(&vcpu->mutex, role))
> +			goto out_unlock;
> +
> +#ifdef CONFIG_PROVE_LOCKING
> +		if (!i)
> +			/*
> +			 * Reset the role to one that avoids colliding with
> +			 * the role used for the first vcpu mutex.
> +			 */
> +			role = MAX_LOCK_DEPTH - 1;
> +		else
> +			mutex_release(&vcpu->mutex.dep_map, _THIS_IP_);
> +#endif

Lockdep supports up to 8 subclasses, but MAX_LOCK_DEPTH is 48. I believe 
it is OK to add a mutex_trylock_nested(), but can you just use 0 and 1 
for the subclasses?

Cheers,
Longman


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
