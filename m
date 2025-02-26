Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E143AC021B2
	for <kvm-riscv@archiver.kernel.org>; Wed, 26 Feb 2025 00:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=1R0g2pXITOy0wMwoUBux59jXPq/XmymFY+8doSYCIdI=; b=k66mh1R31pmUXuOh3dV4yg2DRM
	iIiP+ZML99pcVfIrlL37lfesSInQakkfxlg7v7O8C0ppyoMUhMqLoqfbPtP94o10XurLl6zTEsdVa
	X64UpdrZBS8GYgwRUTvcWSw+DagtrMo5EjN4AXfe7tTxWzl6hKmcx/gQghzqm+L6bvVpUXdou7NFW
	bXiL7mV0naDVmdSL/epGdeqLim5q7tHxYlCxsnVnreqo51Tme2uom1dpShDVRaYf29cAicOTuGn2n
	ZRucwTEhtpX7fr52VEHpsLWx32ujGBRHjOtWM2D2WwfJ+1PP+L0z0eTWSqVLE2kYPjpQpyTh1Jd0a
	8HTLrMfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn5JC-00000001sNJ-2XyI;
	Wed, 26 Feb 2025 00:29:54 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn5Gw-00000001s6h-3IYc
	for kvm-riscv@lists.infradead.org;
	Wed, 26 Feb 2025 00:27:35 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2fc4fc93262so13274079a91.1
        for <kvm-riscv@lists.infradead.org>; Tue, 25 Feb 2025 16:27:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740529653; x=1741134453; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HAdIv23vtdyhU1Wievr5YncZEjjI/nIoxYj3wcoEoAc=;
        b=3LCxbC10dJsNohIs3LlPVFrPr2jfywPlyutOOka1T05aUuN8ZYf8u+I0lDx2qW316T
         ONtKtcE2PQ/kfHglRJDKBsLD35SgHsLX1Hdgw08xoQLmXKddxfIcwHafwDGUCSQrhiAb
         ptq2BNcsdSeufldokbS0I2siNqb/3iQeDPsifkAM+JSh+sBLaNgjVBD2FMNJo/QLRZxY
         DFgdipMsX4H3SUyjvK72Z+kd+81jq2WPqaSsL1F2wj0gbbNMMk+h0cIhTz3O6ekMBEpI
         PnI5EBlhErfC13TLKBQB/Ugj31pbnKCtNhGv3v14LqLWCkSYHK9RbFtVWYhrvIZcxQJ1
         9dFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740529653; x=1741134453;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HAdIv23vtdyhU1Wievr5YncZEjjI/nIoxYj3wcoEoAc=;
        b=U8ddB0GStSKeN2bTW6dNTxYjJacUwH6LX2P5Xok03F88bJ1VVPFJAmi5Q+BHUBswqp
         NGiBDuyvE6srprU9Vi6VLV0VBpb/V4nO1Dmrsw0XDqMV9zf2+QZU367w1i0TFqX1nYIW
         lNRgFqW+6FFoi3SvwYzF9sGzuoMbtf600ze+npBhzH5I4ettfODFatH64wpQaCu51y0w
         csupzD4iu+JO52B+7fTRDZKXz16FYmn0nu95+TMzqI5M9yr15N4YHh71oJHFRn+NBtyQ
         /bBt4Q4FiAMWDZT+w2pLYeBF/IhzqHdavix4tuY4XQf0p+t0m8X+cojuhofERVkTejzv
         pdjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnXTO0cPd3UZM5Y4blJYq59Ho5KE5VcENED1YGhYu1QQZcHkov9IaBsHzJBSqE7xkL8qGF9APYtFA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7/QaouMUl/FeJd0vLxXYImZvz8j9L8Tlk3quzz5WGvhUqr/Ol
	ybaV8ApqVZM84MFM43gLQ6+SDyGHbEOUYu68j4LBJH3KKuxG9KUNwc8WUUwNHMBIiHnp8Ck1W3J
	yTA==
X-Google-Smtp-Source: AGHT+IHOUZMQJO44VDHKi6ofhJ07QZ2dZ6izn0Wyr9X1ZaSMCJ5d0/qSAVcldTsRp+dWt1bBYLTGrWWvHEg=
X-Received: from pjbsb8.prod.google.com ([2002:a17:90b:50c8:b0:2d8:8340:8e46])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5483:b0:2ee:f076:20f1
 with SMTP id 98e67ed59e1d1-2fe7e218ab9mr2765842a91.0.1740529653271; Tue, 25
 Feb 2025 16:27:33 -0800 (PST)
Date: Tue, 25 Feb 2025 16:27:32 -0800
In-Reply-To: <6475f9c7-304a-4e0b-8000-3dc5c8e718e9@redhat.com>
Mime-Version: 1.0
References: <20250224235542.2562848-1-seanjc@google.com> <20250224235542.2562848-2-seanjc@google.com>
 <6475f9c7-304a-4e0b-8000-3dc5c8e718e9@redhat.com>
Message-ID: <Z75f9GuA9NfKo37c@google.com>
Subject: Re: [PATCH 1/7] KVM: x86: Free vCPUs before freeing VM state
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Aaron Lewis <aaronlewis@google.com>, 
	Jim Mattson <jmattson@google.com>, Yan Zhao <yan.y.zhao@intel.com>, 
	Rick P Edgecombe <rick.p.edgecombe@intel.com>, Kai Huang <kai.huang@intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_162734_819123_74C4DE7F 
X-CRM114-Status: GOOD (  12.09  )
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

On Wed, Feb 26, 2025, Paolo Bonzini wrote:
> On 2/25/25 00:55, Sean Christopherson wrote:
> > Free vCPUs before freeing any VM state, as both SVM and VMX may access
> > VM state when "freeing" a vCPU that is currently "in" L2, i.e. that needs
> > to be kicked out of nested guest mode.
> > 
> > Commit 6fcee03df6a1 ("KVM: x86: avoid loading a vCPU after .vm_destroy was
> > called") partially fixed the issue, but for unknown reasons only moved the
> > MMU unloading before VM destruction.  Complete the change, and free all
> > vCPU state prior to destroying VM state, as nVMX accesses even more state
> > than nSVM.
> 
> I applied this to kvm-coco-queue, I will place it in kvm/master too unless
> you shout.

Depends on what "this" is :-)

My plan/hope is to land patches 1 and 2 in 6.14, i.e. in kvm/master, but the
rest are firmly 6.15 IMO.  And based on Yan's feedback, I'm planning on adding a
few more cleanups (though I think they're fully additive, i.e. can go on top).

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
