Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE848CD8CA8
	for <kvm-riscv@archiver.kernel.org>; Tue, 16 Jun 2026 06:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DYbh2QELkQ7N2s3n0IrE0yqQ0hkAy7uZr8dHnnNrN9s=; b=2fBb2MxBdNOVFZ
	zCfZGCNmoQ1Q9GSLql70y6pFTo8mWnOQsfX5bR4hGSQCHRHsjg5t/NRTn7e8F435S6JODnkObVmrB
	pO+N1FN+Cg0BIq2Ea9msQNEqRWD7w4Iz3FsPH8PHN224Fxc1XKXgDPv82o+QwFhVrxxiVF3cTqV0p
	U2FnMaOkZu198qcO1fNLtaecllIqWf/Gzg9u1jsXAlPW6g2PVp1DTyddk3HAovdlAgnAGxc65RhRK
	JKdeadgvM4gVhdTWqp9J3H5zzSs+R61vT01MfJvGT+Et5S4VR17mrC0v+QFZ6VC1IqrGQ8/06YMFY
	4VZDtVLJ9xsAolvx8PrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZMwX-0000000FHhy-2F61;
	Tue, 16 Jun 2026 06:06:37 +0000
Received: from mail-dl1-x122c.google.com ([2607:f8b0:4864:20::122c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZMwV-0000000FHh8-3SUR
	for kvm-riscv@lists.infradead.org;
	Tue, 16 Jun 2026 06:06:36 +0000
Received: by mail-dl1-x122c.google.com with SMTP id a92af1059eb24-137ec563a95so4523576c88.0
        for <kvm-riscv@lists.infradead.org>; Mon, 15 Jun 2026 23:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781589995; x=1782194795; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IYT2HIZ/TljEaPuQNyUPwKuwE+O4A3F++I0Be4tA0UM=;
        b=Bv5N4JKWgxIzfHSkJbJSLWfq4G6AFxPkWLZOijSs9KkEPwBPbY6Rarnw9axNViDHa3
         To5IHfeakl0hGtzd/4C/TKyat8ceGndCRMjRKIfPL4ew8apEq0GJ8EzRYBwFmibBuTj3
         Vucy/mL9ZFXZP6VtNpZYVHh0/rpVzi7TX7p5ppUHDzM3reSv+RyIpkVhXCd0SVpj6MBI
         dM4O5K8rGcGZ/EHBEhSpyvo022JNoD2ANFzAI/MWAwMvP4jSsjtsIGg1PY+voLDfPz9I
         smPsJYAdOIP2tp5CXuI6XtVh8cipqAxmziT71SjslLClReJ25YqmJW25s8LgRSD+w7Py
         idaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781589995; x=1782194795;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IYT2HIZ/TljEaPuQNyUPwKuwE+O4A3F++I0Be4tA0UM=;
        b=kBFEBjfmE4uAtpYJaryfYmo5GXAmnbQF22dRbnBeydwlZ72fsu+DPrfhTZqcyu6D+a
         XPfj4aE+Y6TqeGmlseoWBHIehgWuhoGAZZiYkotxp4VQzvnnFj9Zt2x0VL669EUBOVnP
         gCPTTfRaHxMWMxJAqs7L6Mac1BzI73WDaCeRNNu6n8qqI4DY5QV+9fK7ModFUfmp+p9d
         F/iS7XpOJbN4G40IPZaIy63XoY1Z6z+NI+S8bvZhW6NNgu6S+TM5r/scX9eK2LE8HRsL
         Zy8bY3pDxK+zq4Rra+2QKnSh78a9BYbPkiaRJsWtFVGI3cwIdRqWEwtj/Peghl6Er8nw
         vqlQ==
X-Forwarded-Encrypted: i=1; AFNElJ/7jfDdgR64zkYbJ/JBL9ULnJauTzK7GlZild5oxjCzRStFIrj1ImGRwZe/IgS0fEHdTN7apnlBSL0=@lists.infradead.org
X-Gm-Message-State: AOJu0YwENGfgs4bE8zQfFrmuOBXJ4S1CICCX3cepj7i42I3vOZT+YcyY
	LHtxaAE5IeIgkgWnFA2pyxSKRi6B5d8/D9rxtUePeeZHvI9KtKu4DVm4
X-Gm-Gg: Acq92OHKVWtiUH9M8NMTHw90IKtKttN5RKaLLwsnAWnmtvcPh6rfe4tTVASzwTF4KsU
	TwbUFJ2sy/PQgEJ5nUHh8/bI0XuiffrdaL9ENTlhiCKHnkY463Ul5PhPo0qYSaYh0dxDJ3RhQ5T
	WeCYjjjj++yDAH6Qee6vPjX+ow4MUcLsk+1rxXh0CRs70vY2T2vBWG7kjLzCwYyob9WO5fROY6h
	N5GngxyVqna3KZZnS6pyeevs3lYgr42yjhhCFmnT14SgIokn8tUjRrikJmOjgfsbUDb2MdZRt5w
	Elby0Kfq8Xk2FhZQBklxPTONwQ2wDlhcrxqgG8aW9fAEcB4QfAtyicOr4XFFW0VRCilGCqngWjb
	Gsd31JdbQPXk2vjqOGqFIbYXD2LtONS3Vz3bK4/YsCvFj0pwaQUOFt2qPuut2P3xu5zWLfuBo7c
	8s3YBNZ2vie8o=
X-Received: by 2002:a05:7022:305:b0:136:b370:64de with SMTP id a92af1059eb24-1387901e454mr5481988c88.32.1781589994812;
        Mon, 15 Jun 2026 23:06:34 -0700 (PDT)
Received: from blinky ([2601:647:6700:64d0::92d1])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1384b96d6c4sm12930812c88.9.2026.06.15.23.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 23:06:33 -0700 (PDT)
Date: Mon, 15 Jun 2026 23:06:30 -0700
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: Nam Cao <namcao@linutronix.de>
Cc: Charlie Jenkins via B4 Relay <devnull+thecharlesjenkins.gmail.com@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Conor Dooley <conor@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 04/16] riscv: kprobes: Use generated instruction headers
Message-ID: <ajDn5oINgUzKhELv@blinky>
References: <20260407-riscv_insn_table-v1-0-54b4736a1e77@gmail.com>
 <20260407-riscv_insn_table-v1-4-54b4736a1e77@gmail.com>
 <87mrx1eh8c.fsf@yellow.woof>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87mrx1eh8c.fsf@yellow.woof>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_230635_865692_877C0EDC 
X-CRM114-Status: GOOD (  10.62  )
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

On Thu, Jun 11, 2026 at 08:14:27AM +0200, Nam Cao wrote:
> Charlie Jenkins via B4 Relay
> <devnull+thecharlesjenkins.gmail.com@kernel.org> writes:
> >  bool __kprobes simulate_c_jr(u32 opcode, unsigned long addr, struct pt_regs *regs)
> >  {
> > -	return simulate_c_jr_jalr(opcode, addr, regs, false);
> > +	unsigned long next_addr;
> > +	unsigned long *regs_ptr = (unsigned long *)regs;
> > +
> > +	next_addr = regs_ptr[riscv_insn_c_jr_extract_xs1(opcode)];
> > +	instruction_pointer_set(regs, next_addr);
> > +
> > +	regs->ra = addr + 2;
> 
> c.jr does not change ra.

Looks like my tests need some work :/

> 
> > +	return true;
> >  }
> 
> We have CONFIG_RISCV_KPROBES_KUNIT now, please try that.

I can try to extend those to cover more.

- Charlie

> 
> Nam

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
