Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31957C71132
	for <kvm-riscv@archiver.kernel.org>; Tue, 10 Jun 2025 16:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=s1yiVQxDRzDRAFs3i8PoRE82hiMkEgPl0a8tpht9vKc=; b=TrOSXAtgT45Xui91aQqqhExhaO
	wIh0iPWOqm3/5NvYZTzRgw3HSyi8cDFUJcLghUQIPitElEwOGo5kUYDKXaPqaYXViYNgP0HHZc4QS
	IvXc5D1H+y1v5DlXkJVztFD7ovd/OSWNSd+tXGqC68E4qhxv5BG1oA3fl89aE+lRzzPFz1AtJCSip
	8qGqWzMSTbUc4crRhPuLuTiyowbNv/SWpnY3P6iDB5YfBYUuZ9YSi3jeo6KcLnm6WdvkZQkBPkxtM
	FbJQg6zThBEGSp+48C0Zy6rEOktq3KIrrfuf1QAAygchiJUuXJIajOusVKpBxUz2Q5hxicQxHAs/y
	8yfv6L7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP2H9-00000007Y2y-3VCU;
	Tue, 10 Jun 2025 16:56:39 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOzSQ-000000073X1-23l5
	for kvm-riscv@lists.infradead.org;
	Tue, 10 Jun 2025 13:56:07 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-234a102faa3so37615865ad.0
        for <kvm-riscv@lists.infradead.org>; Tue, 10 Jun 2025 06:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749563765; x=1750168565; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=x3KVVoKoPgb7czEnOr1ErvqynWAnhwXrGnn4+KyAYR4=;
        b=X+cMxD+b7QFGVVO9CU+IX1d0KI3jCOk58v5whyZoGzu4cGYshYkeqmBVKYy+Yb/qUq
         2eLPfyS4PvJZ6+gMX0/dSEes8p1lBhI96dD602YFTPDHJ5FnBr7gClJ5aXLascIceRQT
         jkaa78/DsyM/tCqFdMUScIiBRbfVFX9szpCnypHPVa3EnWpuN4YSv93uMwzePqQRXMaW
         GWMXu74W6xUDAgUCMmOYAE2RU2SQpYLKpYDpvybwMGXul1ZtQJ1qNT77ViIS3XsO/mmm
         vHwzXuoCIK2ZPOoyMGhdVBIPtDwaMJNWwzFZRwDr28ea5fFsRF+bohlYjnAxdsOVXZGv
         7gBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749563765; x=1750168565;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x3KVVoKoPgb7czEnOr1ErvqynWAnhwXrGnn4+KyAYR4=;
        b=twL3irLF+HkgOIisOuW7GI+UdAtyHJ8uzA64WAzgxcnNryB5NFFtLjYB0C+TT6TfQq
         GJMRfTEaNwDTOseaAmaZb+vF7ShMP/J5FD1ePK9o3Lp9Qx+sfCA049rxmqziZXRszdWW
         nxBcxnbbq3lmg+fMrgygxrWWeKJuHB1FAnOJq3wPS2Q27vFx0846TxEleWkcMb7m9ACS
         /8y4gCl1A09mVpJXgfRZbJs5CEDftAQZpAx+sVY/Nyp5ridJAbwFyNtR8F8ROz1OEI94
         fW8xyg8OPpPDn4qM0Oe9BDXEEh5bc1e8UwWG2uSGjdG421CuM2i6pkZiDfQEvunR2QnC
         hrtA==
X-Forwarded-Encrypted: i=1; AJvYcCWg0tM0+Nl0gs5jSjgAN6xqtO4vX4plpz9MjUihiLAJJObvB+wNOdKlYoe2agNmzLAGQ4kHrMaJszs=@lists.infradead.org
X-Gm-Message-State: AOJu0YzfMjrF32E+wsSR07rgR/PUqRUoUoS1NksdyJObCUxNDjk6P3bh
	07Cqew3GTEP8IqXSz3TjLHrjEuajxT0NbPX34ktmLCjjc62ir2YHwcI/pC/Fs/qrvglobWVwcXD
	WcVwZ0w==
X-Google-Smtp-Source: AGHT+IF5iWO+Sp3cyEnRYuhYT7CW/Xfid4XVEYLemf3GthWwx71VVskqhGeToz1gNCmRF8eGLZ45Y+Wg+lg=
X-Received: from plbmo12.prod.google.com ([2002:a17:903:a8c:b0:235:895:2564])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:c952:b0:22e:421b:49b1
 with SMTP id d9443c01a7336-236383b08f1mr41011285ad.48.1749563764685; Tue, 10
 Jun 2025 06:56:04 -0700 (PDT)
Date: Tue, 10 Jun 2025 06:56:02 -0700
In-Reply-To: <27a6c2fe-8bdf-414f-a49c-19ad626cd131@linux.intel.com>
Mime-Version: 1.0
References: <20250529221929.3807680-1-seanjc@google.com> <20250529221929.3807680-3-seanjc@google.com>
 <27a6c2fe-8bdf-414f-a49c-19ad626cd131@linux.intel.com>
Message-ID: <aEg5ckEXzQnF8PkH@google.com>
Subject: Re: [kvm-unit-tests PATCH 02/16] x86: Encode X86_FEATURE_*
 definitions using a structure
From: Sean Christopherson <seanjc@google.com>
To: Dapeng Mi <dapeng1.mi@linux.intel.com>
Cc: Andrew Jones <andrew.jones@linux.dev>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, "Nico =?utf-8?B?QsO2aHI=?=" <nrb@linux.ibm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, kvm-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, kvm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_065606_525762_AFD64ED3 
X-CRM114-Status: UNSURE (   9.38  )
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

On Tue, Jun 10, 2025, Dapeng Mi wrote:
> On 5/30/2025 6:19 AM, Sean Christopherson wrote:
> > +#define	X86_FEATURE_SVM			X86_CPU_FEATURE(0x80000001, 0, ECX, 2)
> > +#define	X86_FEATURE_PERFCTR_CORE	X86_CPU_FEATURE(0x80000001, 0, ECX, 23)
> > +#define	X86_FEATURE_NX			X86_CPU_FEATURE(0x80000001, 0, EDX, 20)
> > +#define	X86_FEATURE_GBPAGES		X86_CPU_FEATURE(0x80000001, 0, EDX, 26)
> > +#define	X86_FEATURE_RDTSCP		X86_CPU_FEATURE(0x80000001, 0, EDX, 27)
> > +#define	X86_FEATURE_LM			X86_CPU_FEATURE(0x80000001, 0, EDX, 29)
> > +#define	X86_FEATURE_RDPRU		X86_CPU_FEATURE(0x80000008, 0, EBX, 4)
> > +#define	X86_FEATURE_AMD_IBPB		X86_CPU_FEATURE(0x80000008, 0, EBX, 12)
> > +#define	X86_FEATURE_NPT			X86_CPU_FEATURE(0x8000000A, 0, EDX, 0)
> > +#define	X86_FEATURE_LBRV		X86_CPU_FEATURE(0x8000000A, 0, EDX, 1)
> > +#define	X86_FEATURE_NRIPS		X86_CPU_FEATURE(0x8000000A, 0, EDX, 3)
> > +#define X86_FEATURE_TSCRATEMSR		X86_CPU_FEATURE(0x8000000A, 0, EDX, 4)
> > +#define X86_FEATURE_PAUSEFILTER		X86_CPU_FEATURE(0x8000000A, 0, EDX, 10)
> > +#define X86_FEATURE_PFTHRESHOLD		X86_CPU_FEATURE(0x8000000A, 0, EDX, 12)
> > +#define	X86_FEATURE_VGIF		X86_CPU_FEATURE(0x8000000A, 0, EDX, 16)
> > +#define X86_FEATURE_VNMI		X86_CPU_FEATURE(0x8000000A, 0, EDX, 25)
> 
> The code looks good to me except the indent style (mixed tab and space).
> Although it's not introduced by this patch, we'd better make them identical
> by this chance.

Agreed, that is weird.  I didn't notice it in the code, but looking at this diff
again, it really stands out.

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
