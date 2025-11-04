Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE183CCFA04
	for <kvm-riscv@archiver.kernel.org>; Tue,  4 Nov 2025 18:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=vG05borf6m8znCQgAlzF5K5E/NyLL5zpaElD1+wmWpE=; b=lEZHZVzbloGJNXnDJPo/ms+eIq
	5bicTRMH9VuEdja0MNXdyOJVhFWJoY6tjzoFrbkIcBBVcyi9t7qazEqV24IOYjJmGqhvvcG0zvBdt
	7qdBoju8EQHtdOAq8LNfYAS1WqDDdnZqxLRvaW813wEir4Jg2H1lhvT475Gew/EjhvsSTY60R00I0
	DeixSRBM7d5nFiNMjk34tyCWj2xxm0aMRdPi74Db4J3G2LuP/UOj+2dG0/wywpQkVCNip9p7YZpFp
	PcYEMmf/+D3m8IWJY4q1t+zBYMOe46RZADDcTOxwKE5mgn4z4gbCvvjAbbsRfE99VCmTUwnXg7sRi
	OBhusoNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGLMZ-0000000CKEA-1aZV;
	Tue, 04 Nov 2025 18:02:35 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGLMW-0000000CKD5-0sZm
	for kvm-riscv@lists.infradead.org;
	Tue, 04 Nov 2025 18:02:33 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-b57cf8dba28so5117728a12.1
        for <kvm-riscv@lists.infradead.org>; Tue, 04 Nov 2025 10:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762279351; x=1762884151; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=z7TAMX5tgRxcaQgmnIz2dr5/J34h/wClq0GmkAjx/eU=;
        b=CIcncL6ZiHm24mQDQPyBWq3Ar2EZWWn/pvbLdnjD9UiboDrc51VsxM/VsMfOAC3Jh3
         w3VTlOSiyWa2mLG9GC89C7C1vJkKHrT4ac1XD8iXZSR9o/yXiUzgeLlpJSKxJWB9dvcm
         32+nvJGdbiZ56GijykgX85qL04ZPVjKgVJ4dvmwp624+S6rdR5ZSaZP75+A5U9jyWG1Q
         DOi35F9QO2lYdxR9eIrffWE9X0EQ5oAqbbt3PfatdEy536GEGXMqeOha5P5Nl+dL98+x
         HtyqBmbpcMLsjrbnK8tyNIa1TtgD73nT6YdJoDbNtlyu9i8zA2VycJB4G5G5U/zMgtY1
         F9IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762279351; x=1762884151;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z7TAMX5tgRxcaQgmnIz2dr5/J34h/wClq0GmkAjx/eU=;
        b=glKHxMM6jLriW5Lx3PNTk96l7Uu+l87pW2YqkbP6tozC2bqpcyfU8L2X71u/2g7Bij
         ypKC+VRWXOWkufvJbIeH66+V6nMx7GAA+lBP6++5q2kOb0khBgpfUBcqE3G5VJWqtX73
         n+ASiK4E2S5dzPuarwuMF7rCxPRe6992yY6bNFBIm7hDNKChjlqRb83y6obb5wj4iQ8J
         meD5uQ8zUF6ZPXsy2liSvHEHe99ubw4FmSZNL1QuOZDhl8aDVhP8JIDVgS2KMzwmahM7
         VktEEOp/450UUOXXnaKPxdZfmWUC1GIvAjq6C+4YSrX3L7w/oSzfiNYpO6m2QUJ9/VvJ
         Ea+A==
X-Forwarded-Encrypted: i=1; AJvYcCXbOWLWiu4rJrf0f5mOJ9FM/1GsGcFdDP9lGHA+zAcBojFLbdmRTSXS4wIhx0BCN1pmd7cNbwWZ5B8=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxgd2yUKyv4Uz2NGr4uGcoDQQy6xTawEv7swlhEHUlh5lfwZZRP
	diVL7YM9eIfyPeqRZuYjIEorO3//seOd5xw/v5Nxy9g4WcESqTbcL8HQnj2O0qqs/eiUM8BzOvu
	tQojDJw==
X-Google-Smtp-Source: AGHT+IEToeihVC8rNRp4WXHuCXbja7cJV9DF8/gVM9lRFkFysIMA8abH+TqAL0waWRxDGRap6/agKlo3e+8=
X-Received: from pjbmv10.prod.google.com ([2002:a17:90b:198a:b0:340:d512:22dc])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:6d92:b0:32b:7222:7459
 with SMTP id adf61e73a8af0-34f8591c355mr151990637.34.1762279351036; Tue, 04
 Nov 2025 10:02:31 -0800 (PST)
Date: Tue, 4 Nov 2025 10:02:26 -0800
In-Reply-To: <31da959f-d004-4ae0-a6a7-d5d31b646b70@linux.intel.com>
Mime-Version: 1.0
References: <20251030200951.3402865-1-seanjc@google.com> <20251030200951.3402865-28-seanjc@google.com>
 <31da959f-d004-4ae0-a6a7-d5d31b646b70@linux.intel.com>
Message-ID: <aQo_spywQuek7fUi@google.com>
Subject: Re: [PATCH v4 27/28] KVM: TDX: Bug the VM if extending the initial
 measurement fails
From: Sean Christopherson <seanjc@google.com>
To: Binbin Wu <binbin.wu@linux.intel.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	"Kirill A. Shutemov" <kas@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	x86@kernel.org, linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Ira Weiny <ira.weiny@intel.com>, Kai Huang <kai.huang@intel.com>, 
	Michael Roth <michael.roth@amd.com>, Yan Zhao <yan.y.zhao@intel.com>, 
	Vishal Annapurve <vannapurve@google.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Ackerley Tng <ackerleytng@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_100232_253166_39B4F87F 
X-CRM114-Status: GOOD (  18.58  )
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

On Tue, Nov 04, 2025, Binbin Wu wrote:
> 
> 
> On 10/31/2025 4:09 AM, Sean Christopherson wrote:
> > WARN and terminate the VM if TDH_MR_EXTEND fails, as extending the
> > measurement should fail if and only if there is a KVM bug, or if the S-EPT
> > mapping is invalid.  Now that KVM makes all state transitions mutually
> > exclusive via tdx_vm_state_guard, it should be impossible for S-EPT
> > mappings to be removed between kvm_tdp_mmu_map_private_pfn() and
> > tdh_mr_extend().
> > 
> > Holding slots_lock prevents zaps due to memslot updates,
> > filemap_invalidate_lock() prevents zaps due to guest_memfd PUNCH_HOLE,
> > vcpu->mutex locks prevents updates from other vCPUs, kvm->lock prevents
> > VM-scoped ioctls from creating havoc (e.g. by creating new vCPUs), and all
> > usage of kvm_zap_gfn_range() is mutually exclusive with S-EPT entries that
> > can be used for the initial image.
> > 
> > For kvm_zap_gfn_range(), the call from sev.c is obviously mutually
> > exclusive, TDX disallows KVM_X86_QUIRK_IGNORE_GUEST_PAT so the same goes
> > for kvm_noncoherent_dma_assignment_start_or_stop(), and
> > __kvm_set_or_clear_apicv_inhibit() is blocked by virtue of holding all
> > VM and vCPU mutexes (and the APIC page has its own non-guest_memfd memslot
> 
> Nit:
> It sounds like TDX is using the memslot for the APIC page, but for a TD, the
> memslot for the APIC page is never initialized or used?

Oh!  Good point.  I'll tweak that snippet when applying.

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
