Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 959D3CCD1AF
	for <kvm-riscv@archiver.kernel.org>; Tue, 21 Oct 2025 16:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=D4Ifns8HlNbfp78qAbKnnMZ3bHj5DRwPQok9SWxd0qM=; b=j5FJ6kabamo0ViLy8NhJJPzLvc
	F7I+C47sLlP4ysE+o/ZUdmFWtRw+KIkCdjzwC4DiAWgWYr7UVGJ30LZ5mqj/LkZoF1M5LHGmwNG4H
	VCNGhTq2BeBweDfylBbs+PzEB4ToPfywggvC/y2SPrV8JB9oT6/M8fs3rtyXFuHmgHZ30JXLgLk1g
	RQEGAary2KFr0xUzlG8Q1M87jNdvB08geNdLh7SdxlcTmBhyDpbqsDRoz7XMSrOd/uRXi1VmupTvy
	i8+DzWYqlEUY8tXxCHtzdf6gP2Azlu4vrbpm908bmz93x0WiW2Odm7lmf6m0xmGPr2BmEqVTcSUuR
	EfN9UZJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBFes-00000000Ae0-0jWI;
	Tue, 21 Oct 2025 16:56:26 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBFeo-00000000AcN-3kM6
	for kvm-riscv@lists.infradead.org;
	Tue, 21 Oct 2025 16:56:24 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-290b13e3ac0so56283295ad.0
        for <kvm-riscv@lists.infradead.org>; Tue, 21 Oct 2025 09:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761065781; x=1761670581; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=QUj6Jzqtl7pAwgzbknudC50aTFamgZNMeXgKkiBAGZE=;
        b=M09Ic7L3EXTJomsPutM35QBkir6X7cyP+8irAAyksRHaxK+cRdAYS1HdGVczkSXIim
         ExhRkrw1QfyHFGUweVcKblhccGB24mBEeb1TVHdfmPWZX547JLAv5axjcru5fk7MjOHA
         IYGYWjx6CCXLPNI78yOOQ7QIMsK0LZwxIzdoBA8A20LKWylO4aAVHwg4/vKM72PHClVs
         KEVmfxNoQgo/QjAEftgAmJcYlS+7mW90YfyFne+dglikYs3+3u5XfK/Y/1112giztTm4
         viSRjgtNzx+d7gF4lFJdJdjBVoDSl4tdcJDb3FBH+yXbBRnykz/Sm+gj0k049CEd3SQn
         ZOqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761065781; x=1761670581;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QUj6Jzqtl7pAwgzbknudC50aTFamgZNMeXgKkiBAGZE=;
        b=jG/4P/xAvmcF7jOLyZxd5gsI270jQqQtrNn4wi8NmKj1pVWT3bANypUB2VtURtRiuB
         Soe4nsRuJMFVYklVHlAGzSZ+dy2Qq6UFUk27hnWQK62GEK2HRSRepfuO/G7JVcgiGVzr
         vaOlR0GIheqzwms/qI0Pe6n7s8o9hekrsQU6ytHf6tt6ySLBVvcTthTZOnyhghYiyKU9
         TcVURxqMMo/iNVf7m4C6U244hiRZTh1MRzprwC6ULuDwDXnKjXp38PkqdlKs3S95lf3+
         c/AGFmJVY0O/PaYyHAzYAwknEwbQdumolC2rSduAb4Icb0zm+o3cWTufN9sCVIYSBpbU
         X5cA==
X-Forwarded-Encrypted: i=1; AJvYcCXr2N55D5UnTDGDBHh5868vJK0y0ieqiMM84ojwmJvx4wagcjwruvdlVntZRLgF98NlwG2+dVUf8LA=@lists.infradead.org
X-Gm-Message-State: AOJu0YyESFDRN5vd89mG2mHKABn5rB60eY8wgjpSrrERHqeldNYzmuH6
	VePKYK/v2yfQy+9/ldUlNe5o0M8kecJc8rd+7G/SLhwB0wy+cX9XX0IRPSTVVqjNA6eKeF1pzMq
	9iA8LDg==
X-Google-Smtp-Source: AGHT+IGOqKmUzCbfjGYr8B2jY/C1mdIZnvxK8+ss+AVkwVotQdjiGEd+3SJ7VfMTaFoQGYSh7+8f99sR5n0=
X-Received: from pjre3.prod.google.com ([2002:a17:90a:b383:b0:33b:51fe:1a75])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e88e:b0:250:1c22:e78
 with SMTP id d9443c01a7336-290c9c89c9amr235880025ad.1.1761065780727; Tue, 21
 Oct 2025 09:56:20 -0700 (PDT)
Date: Tue, 21 Oct 2025 09:56:19 -0700
In-Reply-To: <d0b369c65e33518d57a40a70c0d13f70bd64db47.camel@intel.com>
Mime-Version: 1.0
References: <20251017003244.186495-1-seanjc@google.com> <20251017003244.186495-24-seanjc@google.com>
 <d0b369c65e33518d57a40a70c0d13f70bd64db47.camel@intel.com>
Message-ID: <aPe7M1aUPwqDmQbY@google.com>
Subject: Re: [PATCH v3 23/25] KVM: TDX: Use guard() to acquire kvm->lock in tdx_vm_ioctl()
From: Sean Christopherson <seanjc@google.com>
To: Rick P Edgecombe <rick.p.edgecombe@intel.com>
Cc: "chenhuacai@kernel.org" <chenhuacai@kernel.org>, "frankja@linux.ibm.com" <frankja@linux.ibm.com>, 
	"maz@kernel.org" <maz@kernel.org>, "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, 
	"pjw@kernel.org" <pjw@kernel.org>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, 
	"kas@kernel.org" <kas@kernel.org>, "maobibo@loongson.cn" <maobibo@loongson.cn>, 
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "maddy@linux.ibm.com" <maddy@linux.ibm.com>, 
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "imbrenda@linux.ibm.com" <imbrenda@linux.ibm.com>, 
	"zhaotianrui@loongson.cn" <zhaotianrui@loongson.cn>, "anup@brainfault.org" <anup@brainfault.org>, 
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, Kai Huang <kai.huang@intel.com>, 
	Yan Y Zhao <yan.y.zhao@intel.com>, "michael.roth@amd.com" <michael.roth@amd.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ira Weiny <ira.weiny@intel.com>, 
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, 
	"binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>, 
	"ackerleytng@google.com" <ackerleytng@google.com>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, 
	Vishal Annapurve <vannapurve@google.com>, 
	"kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>, 
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "x86@kernel.org" <x86@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_095622_937878_8ACFDE47 
X-CRM114-Status: GOOD (  10.17  )
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

On Tue, Oct 21, 2025, Rick P Edgecombe wrote:
> On Thu, 2025-10-16 at 17:32 -0700, Sean Christopherson wrote:
> > Use guard() in tdx_vm_ioctl() to tidy up the code a small amount, but more
> > importantly to minimize the diff of a future change, which will use
> > guard-like semantics to acquire and release multiple locks.
> > 
> > No functional change intended.
> 
> There is a tiny functional change. In the default case it no longer re-copies
> the struct back to userspace.

No?  The default case doesn't copy the struct back even before this patch, it
explicitly skips the copy_to_user().

	mutex_lock(&kvm->lock);

	switch (tdx_cmd.id) {
	case KVM_TDX_CAPABILITIES:
		r = tdx_get_capabilities(&tdx_cmd);
		break;
	case KVM_TDX_INIT_VM:
		r = tdx_td_init(kvm, &tdx_cmd);
		break;
	case KVM_TDX_FINALIZE_VM:
		r = tdx_td_finalize(kvm, &tdx_cmd);
		break;
	default:
		r = -EINVAL;
		goto out;  <====================
	}

	if (copy_to_user(argp, &tdx_cmd, sizeof(struct kvm_tdx_cmd)))
		r = -EFAULT;

out:
	mutex_unlock(&kvm->lock);
	return r;

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
