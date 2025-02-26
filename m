Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACDB6C021B8
	for <kvm-riscv@archiver.kernel.org>; Wed, 26 Feb 2025 18:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GPPNwnBkszHWQivL5G8NxYIHGwe3whRnlszJrUCn9/U=; b=jIYm+CuAsevUZl
	WvCZJuGYVkBYz5lWY4R9Zg6OESEEV1kvsYyB6foGvS1AMi99yjw5YivZbTERjh8pNSeYL+KUuPDDX
	0YPNgLsryFBRIuYrZW2tL1ZB5UiiHqVA2fEnIGcmEONgMRrMs4o3/1nfmFts2Wop9yr8ajNZw4coh
	qLfssu2UKmeppeLvcQd7mo1N3a5p+yh9fe1+U7o+CdCBQLoHylJAL5DPPNzvQKS8fUjM/2hlhjeCI
	o5+GCkVZ+nTdKSvBF9XOKf8RUaZD/k50cCoKL2s2XyzWhxC10kPY3lYjed1uxEksM9XBTn93Wx3jT
	GTD1etGMHXvBL0HMRkOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnMIn-00000004yvP-0mXE;
	Wed, 26 Feb 2025 18:38:37 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnMIj-00000004yu7-2nXk
	for kvm-riscv@lists.infradead.org;
	Wed, 26 Feb 2025 18:38:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740595112;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Po4dipnmwfGs5ho6Uar/3eIBvd8Wea1v5VEnmsiU7UA=;
	b=IlH8KxDVBIp+uLFoGuiyW7/e4LCpPfLzP4jq384330ksRW3b9FLVmgCaMrpYro0sUpJ2WT
	q4xjCD3LeUD0foKnk/1J9xLFP54CDB6O5930mOlcLtI5lXrfOw6obKscknS66fvpdKMWmB
	1qBh2IrGNuFTPOuCac+dN0LplwJiJQ0=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-548-6k5wZUZEPZCVQiw3eNAMQQ-1; Wed, 26 Feb 2025 13:38:31 -0500
X-MC-Unique: 6k5wZUZEPZCVQiw3eNAMQQ-1
X-Mimecast-MFC-AGG-ID: 6k5wZUZEPZCVQiw3eNAMQQ_1740595110
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-abb8f65af3dso5998766b.1
        for <kvm-riscv@lists.infradead.org>; Wed, 26 Feb 2025 10:38:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740595109; x=1741199909;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Po4dipnmwfGs5ho6Uar/3eIBvd8Wea1v5VEnmsiU7UA=;
        b=ufaSwghccBjr1C0pLizY5M5LvkOwjAv5nEqJRcplcLHw9xwoL1L00DX8Ebldonj9uT
         RcAfkDtzjNPB37Z4AOQKh+FGPsHc0AmzaVFAe6hiys4seIKBVTjFvffxaPOWnDQBsW8f
         uJ2LQa55qVgr1KjJe38CfbpSYNDlvVIUTWLozRUlypTDFSBVzSdb5zOOzJQYJvx9apXv
         rcObZwdyA81Pytf5jw46cGAsGlrhTGwAu8OtN3e8FDQ7Kj2frIuFCHHVX5NW0marRKpw
         FY0+QmL1/7URNkXLLqPvkRCndydZny04qKJRnI+wqzQ0PdSQqwY9dN3sYeE69SUXRmg7
         lHGg==
X-Forwarded-Encrypted: i=1; AJvYcCV371K1BhuL6ncIbvGSGFkAnwW38r96TOYT3Hhcr9X6L1Ztf6gfoMPey6v0LUGGNPq4AbzQp6vq3P0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yya1khReZy2uoSVsyRU2HzXnx4dfjFGwmeWw8fzKC78Oj4iQ912
	ODQzNK88IjdDyqRyDOw0ENoehc/k0I0WkaYDtEqeZcsnRTMVWM9u+ZgPuFdyOfvc9tA6/kFdg+I
	w6WifLuGpmhsuAXfRLzCPXWNKYu3cvnuRRIozjiSp4Sqbr+Fjmt2gHmGoLP9XcEo=
X-Gm-Gg: ASbGncs3R7NTQO9lHA7ePSRYBeRUCIePux//Fmg8skn+YTgyPCxG//bYR/E5lGKN21z
	8DIzjxYXBwsoBg7MXRqAifRiEuBkjoELR2C2lUE3gEzp9/TQEFkn78FOcg4PugiyCyVR+C1oAWg
	upSyw09g4baVp5bvWrulJiLNN7bgnykKkqvF7LpukuSk7Hmv9R/tr8vzn/bMDZM2YdDFl47cHGV
	MrfWeKvNXwU+SKlIB1cEw+J0F4iS8Nz8gsdz6hPV+HrHkfsDSERH8sBdk9GutXn/x0EN2q2Pnll
	E0ak1AZxhwhPbaydJWUw
X-Received: by 2002:a17:906:6185:b0:ab7:c1d5:14f9 with SMTP id a640c23a62f3a-abeeecf6f63mr518736266b.10.1740595109602;
        Wed, 26 Feb 2025 10:38:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGCDnvlNLlcOiBeBNB6S3TtqOxMTUK/PR46JW7lLq0KgREP2FusBvOHa60dTZ6MWayPAjFhrw==
X-Received: by 2002:a17:906:6185:b0:ab7:c1d5:14f9 with SMTP id a640c23a62f3a-abeeecf6f63mr518730666b.10.1740595109199;
        Wed, 26 Feb 2025 10:38:29 -0800 (PST)
Received: from [192.168.10.81] ([176.206.102.52])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-abed20ac11bsm364226166b.163.2025.02.26.10.38.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2025 10:38:28 -0800 (PST)
Message-ID: <be33873f-ae4e-4db9-bca4-e83e8d4b39c3@redhat.com>
Date: Wed, 26 Feb 2025 19:38:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] KVM: x86: nVMX IRQ fix and VM teardown cleanups
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao
 <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>,
 Huacai Chen <chenhuacai@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Aaron Lewis <aaronlewis@google.com>, Jim Mattson <jmattson@google.com>,
 Yan Zhao <yan.y.zhao@intel.com>,
 Rick P Edgecombe <rick.p.edgecombe@intel.com>,
 Kai Huang <kai.huang@intel.com>, Isaku Yamahata <isaku.yamahata@intel.com>
References: <20250224235542.2562848-1-seanjc@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <20250224235542.2562848-1-seanjc@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: VGqm76UTnGLjAkKT7B2V2Ff-5hA-A8VtOJxGPvZvyOk_1740595110
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_103833_769524_07763329 
X-CRM114-Status: GOOD (  12.94  )
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

On 2/25/25 00:55, Sean Christopherson wrote:
> This was _supposed_ to be a tiny one-off patch to fix a nVMX bug where KVM
> fails to detect that, after nested VM-Exit, L1 has a pending IRQ (or NMI).
> But because x86's nested teardown flows are garbage (KVM simply forces a
> nested VM-Exit to put the vCPU back into L1), that simple fix snowballed.
> 
> The immediate issue is that checking for a pending interrupt accesses the
> legacy PIC, and x86's kvm_arch_destroy_vm() currently frees the PIC before
> destroying vCPUs, i.e. checking for IRQs during the forced nested VM-Exit
> results in a NULL pointer deref (or use-after-free if KVM didn't nullify
> the PIC pointer).  That's patch 1.
> 
> Patch 2 is the original nVMX fix.
> 
> The remaining patches attempt to bring a bit of sanity to x86's VM
> teardown code, which has accumulated a lot of cruft over the years.  E.g.
> KVM currently unloads each vCPU's MMUs in a separate operation from
> destroying vCPUs, all because when guest SMP support was added, KVM had a
> kludgy MMU teardown flow that broken when a VM had more than one 1 vCPU.
> And that oddity lived on, for 18 years...

Queued patches 1 and 2 to kvm/master, and everything to kvm/queue 
(pending a little more testing and the related TDX change).

Paolo


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
