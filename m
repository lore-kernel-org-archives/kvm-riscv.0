Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7D54CF2562
	for <kvm-riscv@archiver.kernel.org>; Tue, 18 Nov 2025 23:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=TQLJUAqPz8DbYj6IGn6cBIqdoCSPvJ2y/rtqCBZ0kRc=; b=w5wzVANneVj0s6bNVm6/LsBqCp
	+brRlzZmY7y2v14brAonaneDmjyjppuq87k6+RFV2W+wkGV7mGYyj0F/Hp/udamUwwRVqJkwzmezf
	ZSxwtbYiSuslDoch6NAc6VFqdJgtqbq+1vnNuJVUMS2XbTnrhW7sItmswZQvUte4GGT+Wcw/Ngoe3
	PCKUVLEk7+IdUGW0gRaGNUUjipnJKSMFVK5ScYmz4Nwqk66KiiFaec0GNNeRAahhuKSkJVbPjmqmW
	s7z0gjwv9C8MGTLBrkSbb/ZMzBliEU7U3+VI/iwpbJW+JnoLE0RyShridBQpN6PNt44vpwmXapIat
	DtPjQkFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLVAW-00000001EmR-17ac;
	Tue, 18 Nov 2025 23:31:28 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLVAT-00000001ElT-2IbX
	for kvm-riscv@lists.infradead.org;
	Tue, 18 Nov 2025 23:31:26 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-343daf0f488so7358863a91.1
        for <kvm-riscv@lists.infradead.org>; Tue, 18 Nov 2025 15:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763508684; x=1764113484; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=vhbmIaudy7FUgPhz41c9iiSjQeSWp1bqqQI5ni0zcdI=;
        b=26jaJNME71p+fMBJa5pXtu02zAEUnsF18KIhxny+Ac9XjlH4W8+10a+z21UFilUNgP
         O0kt1hdhE0hdABbbR1BBKZmoBXbfnJddvOZ4HuXLWJgbStOAlPoXlWDkiR2uxfJhLN5a
         0ny8Qmevs3rMPan+jTe1QrjeN3vOUqZJzpBLRYmsFAp2TxHrcqHQKNbmQgRM1LxHDiJ9
         8cfLm9ISzpGeIandsVeuce6S0zAvGW/cFLOr5sfmpmdDHISeTJti1EpxhGwcoIXDLVra
         mzTj29Q5g2+JBEblYSlIikV+HFfb2ma8KKDv/g9PDopOeibvdCRkVL8NCye8hKJCdqj8
         SjVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763508684; x=1764113484;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vhbmIaudy7FUgPhz41c9iiSjQeSWp1bqqQI5ni0zcdI=;
        b=WWdFBrJyHswm8sUTgH8iCwYS5vPTCHHTqLh1f/qXN5zrsEAClVg5bJOHxX5poZgoK+
         bP8HAbvEipwr9tYt9P6xxY8LI9pAUK8C1vRux3ZFq1DnTV+oNQJ0N5Xdqf56sSsiM5LM
         hDXRXCZoulk6tnp361ZPeErq0e654urANAqEJsAdYayL9v6js9W/jlgAyvPzsxGFb5yx
         7oudDh24XgMTjadk1wNqJYdMbUHxvcJNHjCRi6rF2CcsH0f0qPaSXC3BBe5CPd93AtvQ
         NyD2CMChYNBn2awNirvt4wMbGzofd3Dxm27EAIwBKThL89AF0PS732flh4NCxYTiKzno
         HwyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpjWfWhsI8gsdywSDxlF/YQlL5LA6U+JGvgk5LcfXWtl3EYGAl89wajA7JiQAcg/9mtzd2PTcOD9E=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyjj+RuSdpuf4JBa50D6kPnv3j89XA/5TrJkHT0wDszjLhP+2LZ
	eWgW7k3xMiPPGHF0Y2qTuGQyU613BLkfNRC+4gPeOM1xb+2L4QdQRyjjHKC4lgfp9ogHCc24h1Q
	eDXfgEA==
X-Google-Smtp-Source: AGHT+IE1o3OuDgEYh+WwImWCZtj32ss/bDTcBxOCjrPrz1sqG0DLMNd/QRhOEpFCg6/bq23FewNy3cS6Bik=
X-Received: from pjbpd18.prod.google.com ([2002:a17:90b:1dd2:b0:340:e8f7:1b44])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5484:b0:341:124f:474f
 with SMTP id 98e67ed59e1d1-343fa6390cfmr19214010a91.32.1763508684387; Tue, 18
 Nov 2025 15:31:24 -0800 (PST)
Date: Tue, 18 Nov 2025 15:31:22 -0800
In-Reply-To: <20251028002824.1470939-1-rick.p.edgecombe@intel.com>
Mime-Version: 1.0
References: <aP-1qlTkmFUgTld-@google.com> <20251028002824.1470939-1-rick.p.edgecombe@intel.com>
Message-ID: <aR0Byu3bd3URxzhu@google.com>
Subject: Re: [PATCH] KVM: TDX: Take MMU lock around tdh_vp_init()
From: Sean Christopherson <seanjc@google.com>
To: Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: ackerleytng@google.com, anup@brainfault.org, aou@eecs.berkeley.edu, 
	binbin.wu@linux.intel.com, borntraeger@linux.ibm.com, chenhuacai@kernel.org, 
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, ira.weiny@intel.com, 
	kai.huang@intel.com, kas@kernel.org, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	loongarch@lists.linux.dev, maddy@linux.ibm.com, maobibo@loongson.cn, 
	maz@kernel.org, michael.roth@amd.com, oliver.upton@linux.dev, 
	palmer@dabbelt.com, pbonzini@redhat.com, pjw@kernel.org, 
	vannapurve@google.com, x86@kernel.org, yan.y.zhao@intel.com, 
	zhaotianrui@loongson.cn
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_153125_593778_AB303870 
X-CRM114-Status: GOOD (  21.07  )
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

On Mon, Oct 27, 2025, Rick Edgecombe wrote:
> Take MMU lock around tdh_vp_init() in KVM_TDX_INIT_VCPU to prevent
> meeting contention during retries in some no-fail MMU paths.
> 
> The TDX module takes various try-locks internally, which can cause
> SEAMCALLs to return an error code when contention is met. Dealing with
> an error in some of the MMU paths that make SEAMCALLs is not straight
> forward, so KVM takes steps to ensure that these will meet no contention
> during a single BUSY error retry. The whole scheme relies on KVM to take
> appropriate steps to avoid making any SEAMCALLs that could contend while
> the retry is happening.
> 
> Unfortunately, there is a case where contention could be met if userspace
> does something unusual. Specifically, hole punching a gmem fd while
> initializing the TD vCPU. The impact would be triggering a KVM_BUG_ON().
> 
> The resource being contended is called the "TDR resource" in TDX docs 
> parlance. The tdh_vp_init() can take this resource as exclusive if the 
> 'version' passed is 1, which happens to be version the kernel passes. The 
> various MMU operations (tdh_mem_range_block(), tdh_mem_track() and 
> tdh_mem_page_remove()) take it as shared.
> 
> There isn't a KVM lock that maps conceptually and in a lock order friendly 
> way to the TDR lock. So to minimize infrastructure, just take MMU lock 
> around tdh_vp_init(). This makes the operations we care about mutually 
> exclusive. Since the other operations are under a write mmu_lock, the code 
> could just take the lock for read, however this is weirdly inverted from 
> the actual underlying resource being contended. Since this is covering an 
> edge case that shouldn't be hit in normal usage, be a little less weird 
> and take the mmu_lock for write around the call.
> 
> Fixes: 02ab57707bdb ("KVM: TDX: Implement hooks to propagate changes of TDP MMU mirror page table")
> Reported-by: Yan Zhao <yan.y.zhao@intel.com>
> Suggested-by: Yan Zhao <yan.y.zhao@intel.com>
> Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> ---
> Hi,
> 
> It was indeed awkward, as Sean must have sniffed. But seems ok enough to
> close the issue.
> 
> Yan, can you give it a look?
> 
> Posted here, but applies on top of this series.

In the future, please don't post in-reply-to, as it mucks up my b4 workflow.

Applied to kvm-x86 tdx, with a more verbose comment as suggested by Binbin.

[1/1] KVM: TDX: Take MMU lock around tdh_vp_init()
      https://github.com/kvm-x86/linux/commit/9a89894f30d5

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
