Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71E5BC79F9F
	for <kvm-riscv@archiver.kernel.org>; Thu, 10 Sep 2026 11:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:Message-ID:Date:
	In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H4M58RRy3XmbwMluDNdobEqYw0Zio6OuaM1ENOW/ptc=; b=DrOxEBbSnBFlqi
	gMOY5J7FDQ7QDltL+D79y2egZLo3VIUbOPzPq6gXojFVIldLot2fZ4h2tPHSX2x4E61CqXlN0ZOg4
	iAC2Uvd5lDATvgwH41m/MAbA5i+tgqmVmQftOIpL02A0SRqJEs0VWV+a16ZH0zY8FBdfDbjY7qTvH
	A7Fv0Az+Ee61Unb9HzcFV09+lHt8/zEN1gKao8QAXQfSzNDzOoR0w2ZN3J1Zod/mPPurtBzVsIJkt
	aCGVYs+Wnv9xC8MPKdIsF5SIYidkDDZJFfotg7WjVeyR07AjeHmFVRuDEZydgRXcEu4xTc1CCzI87
	qGJ2HiQneeTFxmwjOL9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4cuN-0000000ECCD-43yU;
	Thu, 10 Sep 2026 11:25:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4cuM-0000000ECAy-2JWA
	for kvm-riscv@bombadil.infradead.org;
	Thu, 10 Sep 2026 11:25:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:Message-ID:Date:In-Reply-To
	:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=rKoYJ3dn9mRGunMRInGIver5jTSz1tQREqhFgol67GU=; b=Fkv/pE7MyxaVC+obkBy1NX7BHN
	FfsLQI6xpyV0epI+m8OjKlSec/b4lwclTjI7i7EM+ZtMbeV5Js9+ulXXAMLUF2HYXUmuXHm/b4gPk
	EbcFaY5leDD/WVKHw7Grk0QsDC+KOmPAibKxB+DaU3c7eMcS5+rZzHVz3q4m7W18MkviA1uyi8OnA
	dkF4EjEcX11wX+uRx+NnmO//jflxzlua2jkUYtEYjw1T68Qe+wqkTAPGgRO2Oy/V9fY9hGXGwyLBV
	tjw+y0vrUfnjHIp021sR0BpmwuENigU5wmp/pbjtPWXYvMQSJIGWPcU1TMNtPWqFQg2Yo6Wz9UcCw
	KRUWrCQg==;
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4cuJ-00000002OYs-2AtO
	for kvm-riscv@lists.infradead.org;
	Thu, 10 Sep 2026 11:25:33 +0000
Received: by mail-oi1-x233.google.com with SMTP id 5614622812f47-4b28df1f600so5353314b6e.2
        for <kvm-riscv@lists.infradead.org>; Thu, 10 Sep 2026 04:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789039529; x=1789644329; darn=lists.infradead.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=rKoYJ3dn9mRGunMRInGIver5jTSz1tQREqhFgol67GU=;
        b=YNIcBeyNeOKhvP5TMY9DdNxeHm8dI5a0/70BJ+AoFU407FI9O7NBfvFmQgt6XCxb65
         TlSa17LhhevxwV1SP71vpy0N09dlXUISKgW1zfTzvWDsWVoJ3Dsfji1Q3aN2z+QbFwUd
         VM2amTUon5qdF+LC9r82aLJ57EdrMNvDvTvxdwEm8lumQOZhGsz9Q28zYD3FxjM2nRPy
         riaVHXMeHbjEt2D69RuHRM/63LnhwFklERR6fnPmyIx2jATMaJJsNjLe1ENjU7+Z2/IL
         4bFhkIEJZcVMXp838z2V/PuZlQAEpjmVb6DXk0AavhmFmAzoP/+Ox5FVan7rA9vGGwxB
         DMYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789039529; x=1789644329;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rKoYJ3dn9mRGunMRInGIver5jTSz1tQREqhFgol67GU=;
        b=Yzf2Qw0s7ZTaTiXTZZev5aqNlmOzabpV0Hj29vQHvPwcS90lVGsjb8DeF1adsmVS3p
         Ujr2xZe0Z0uVd9awqHocpLdBrOjqyePH4VJlCSvMGyVAX3Z9MQXr79bBT+DxZNXUvuna
         e4oyI2xbJs1KMZZ9DB1Ma8hZ2G2ZsMV0rSprWumjJ2Tao9+qmMdtczPXy2TN+zxKzLlO
         Iu6K4pMj3hnL5TDKjS91xeu2mh4KzL2vpOdlA5X37kX9v3KkOQPazAZRXIwi4TELO7a7
         XzH3c0PAZlm6VNpQTN5sbjFv6NMRzyV+bRlDMm4HKr/JZxaqlniyoI2wLqP19xle5+kN
         tyNQ==
X-Forwarded-Encrypted: i=1; AKwUvBwVTWkXQ8ghE+Iuh1J+WRcXuE4woCzvmCgHK5e9WqMEwxRgHRJhdPB7YvWvy7kyUqpMjHZrrIApU9Q=@lists.infradead.org
X-Gm-Message-State: AFuF++lgUnymfn9x0qXXsC0Rt4LzZb+SX7oDo0xc9GIabqNVZNHEHAxP
	KGXbyGGjgnN8STcMw5i8L5qwZVx8b1nGF2PEMNClgBkEQwSFrcJmKtub
X-Gm-Gg: AYBFou1wEhA6jo+zoasLaGFBN4D2CXLQqLZ9efkKaDEoIY18O8TFNpcQv+W83TOE7r4
	eOpQy2Lga/00OE0RSvAaP/ZVdKHRR3n7UInuCYrSDkduOmjP6lHLsgdjTwwa6pa9aCk4jkzXhI4
	snVlPuTmoeAl027hfEznIgCIJIguswLxXVwBLXWmgkn/7tQ9P2h1whCK0IrpSfacGQWI5hxQi6J
	HiE/y9GBhHxHsvgaMSi03oINvVH9z+WG8ki6Zl9KHjwwff0LRpMKw/bPJjwjs+Hrl6ZSdRrRPIC
	XIN64UEY/+ZxWHXUnOeKFpj/SR+7k1OzLdJCe6Ras+ksWy9nzSKOvOAp7g12WrN+HiN2e6Raq2m
	zATt9Qj8OuL/BhF2JNkMqu3lGWIv6g3ixJrBESIFWAUUH1Kc07pkJbw7fp7OQlzLQK8kT+6XGhS
	/xIBWfboP7zqpqo04SwfdXO/rvXHi2EkxCiRTnm4QmqyBE1d+6Iw0YiVhFEKJu2mufMPcyom+TM
	Qf79wXDHrIn5iHfdzzWfhF1fqmOwlUP/k8rQw4T4eJXFFOncsVOQuc=
X-Received: by 2002:a05:6808:bca:b0:4b9:e6ab:d086 with SMTP id 5614622812f47-4b9e6abd362mr23531944b6e.38.1789039529448;
        Thu, 10 Sep 2026 04:25:29 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1435c2ae6b5sm6444309c88.1.2026.09.10.04.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 04:25:28 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>, David Hildenbrand <david@kernel.org>, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Itaru Kitayama <itaru.kitayama@fujitsu.com>, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 12/20] KVM: selftests: Add APIs to override memory region types with custom memslots
In-Reply-To: <20260902164123.2546762-13-seanjc@google.com>
Date: Thu, 10 Sep 2026 16:48:26 +0530
Message-ID: <5x0d1hj1.ritesh.list@gmail.com>
References: <20260902164123.2546762-1-seanjc@google.com> <20260902164123.2546762-13-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_122531_652451_0AAFB423 
X-CRM114-Status: UNSURE (   9.27  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

Sean Christopherson <seanjc@google.com> writes:

> Add and use APIs to override memory region types instead of open coding the
> logic in tests, partly to dedup test code, but mostly to add some amount of
> protection against conflicting overrides.  This will allow converting more
> tests to override memory regions without taking on too much risk of bugs in
> the long term, e.g. due to silently overriding a region multiple times.
>
> Deliberately "unroll" the loops in __vm_create() and the CMMA test's
> create_main_memslot() to avoid filling all memslots in anticipation of
> adding an "extra" memslot that is for test use and *only* test use, i.e.
> shouldn't be configured by core library code.
>
> Converting tests to overriding memory regions will allow taking the region
> type instead of the raw memslot in the physical page allocator APIs.
>

May I suggest few changes in the naming of these APIs:

static inline void vm_override_mem_region(struct kvm_vm *vm,
					      enum kvm_mem_region_type type,
					      u32 slot)
{
	TEST_ASSERT(vm->memslots[type] == KVM_INVALID_MEMSLOT,
		    "Memory region type '%u' was already overridden with slot=%u",
		    type, vm->memslots[type]);

	vm->memslots[type] = slot;
}

static inline void vm_override_add_mem_region_flags(struct kvm_vm *vm,
					    enum kvm_mem_region_type type,
					    enum vm_mem_backing_src_type src_type,
					    gpa_t gpa, u32 slot, u64 npages,
					    u32 flags)
{
	vm_override_mem_region(vm, type, slot);
	vm_userspace_mem_region_add(vm, src_type, gpa, slot, npages, flags);
}

static inline void vm_override_add_mem_region(struct kvm_vm *vm,
					  enum kvm_mem_region_type type,
					  enum vm_mem_backing_src_type src_type,
					  gpa_t gpa, u32 slot, u64 npages)
{
	vm_override_add_mem_region_flags(vm, type, src_type, gpa, slot, npages, 0);
}

Those "_add_" and "_flags" in the function names easily gives away
the difference in the APIs, rather than differentiating via "__".

However, logically the change looks good - so feel free to add:

Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
