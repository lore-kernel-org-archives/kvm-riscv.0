Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46CB0C44501
	for <kvm-riscv@archiver.kernel.org>; Tue, 14 Jul 2026 10:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AGLCSSX34hoP8OAt/Fqkit5VdRSAHDFSZbumsxhs/Bk=; b=Zt/XHHjhp6sL+y
	5+CXAfzRvW1sucCiG7BSNQj2k9ak755U/auFHhFuFhMgwn31X+1UbEQvzoYxqUYYoziBFlrPMmzqi
	q0g4cGBGrnVXhUcJHMTGyRx6CjybaXXoK4qBKza2yacNW+hAoM8BMnfOdUvMnUGPG+2xL/zV36LvZ
	cvwWZszEdP+aBiMHCXFS7wTwz/O1qNRualJSkh+N0IK3Cfz+P+3ypTjQ7xGolxvUT3YzwDslX6iwh
	hMd9XUUZIAb1TmGGY+F9gLZNbPzSY7XgtqwSeYp7C2YbbRBndbT3SfdcjtVsaX5w3Wuc7htCZz0Gc
	rhMQBY4zYy6/CDWAWG8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjaLV-0000000BZ3f-30es;
	Tue, 14 Jul 2026 10:26:37 +0000
Received: from smtp-out1.suse.de ([2a07:de40:b251:101:10:150:64:1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjaLS-0000000BZ0q-3khL
	for kvm-riscv@lists.infradead.org;
	Tue, 14 Jul 2026 10:26:36 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 134CB75D55;
	Tue, 14 Jul 2026 10:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784024793; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=khB/to3aOpUTgGTf59zKb1ob5wdV92G9QJtQXjDAoS4=;
	b=X1UcKjUPwFCkcvM34/QaEi0GeBdnyXah3hmHi1D8Poz47UB712qXIXRaJG6edsNfbG2ZA+
	z5cB65T9O/OYv5qY43ugJDHwVaTgllfBIZ9UaWwkNvt07EqCc4MfDsXlOrzcTa1ljoJsh8
	ZREca7S8uqp/stNOGwDBdmvskz1XeX0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784024793;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=khB/to3aOpUTgGTf59zKb1ob5wdV92G9QJtQXjDAoS4=;
	b=DPgDPUNaL/Uj8oEf2qMTyo3J81KosNcpxLKOMxymAIDnO1BMA1vluTZ6/clWzrYO9GdgP4
	w321jUwSCwkNL+AA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784024793; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=khB/to3aOpUTgGTf59zKb1ob5wdV92G9QJtQXjDAoS4=;
	b=X1UcKjUPwFCkcvM34/QaEi0GeBdnyXah3hmHi1D8Poz47UB712qXIXRaJG6edsNfbG2ZA+
	z5cB65T9O/OYv5qY43ugJDHwVaTgllfBIZ9UaWwkNvt07EqCc4MfDsXlOrzcTa1ljoJsh8
	ZREca7S8uqp/stNOGwDBdmvskz1XeX0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784024793;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=khB/to3aOpUTgGTf59zKb1ob5wdV92G9QJtQXjDAoS4=;
	b=DPgDPUNaL/Uj8oEf2qMTyo3J81KosNcpxLKOMxymAIDnO1BMA1vluTZ6/clWzrYO9GdgP4
	w321jUwSCwkNL+AA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0B7FB779AE;
	Tue, 14 Jul 2026 10:26:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id PH4iO9IOVmoNJQAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Tue, 14 Jul 2026 10:26:26 +0000
Date: Tue, 14 Jul 2026 11:26:20 +0100
From: Pedro Falcato <pfalcato@suse.de>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, linux-arch@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, x86@kernel.org, 
	linux-mm@kvack.org, kasan-dev@googlegroups.com, linux-csky@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-openrisc@vger.kernel.org, david@kernel.org, 
	linux@armlinux.org.uk, akpm@linux-foundation.org, ankur.a.arora@oracle.com, 
	rppt@kernel.org, linmag7@gmail.com, chleroy@kernel.org, klarasmodin@gmail.com, 
	chenhuacai@kernel.org, kernel@xen0n.name, kas@kernel.org, zhangtianyang@loongson.cn, 
	wangyuli@aosc.io, tsbogend@alpha.franken.de, ljs@kernel.org, jgg@ziepe.ca, 
	catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de, ryan.roberts@arm.com, 
	pasha.tatashin@soleen.com, rmclure@linux.ibm.com, baolin.wang@linux.alibaba.com, 
	tj@kernel.org, kevin.brodsky@arm.com, anup@brainfault.org, 
	atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, dave.hansen@linux.intel.com, luto@kernel.org, 
	peterz@infradead.org, tglx@kernel.org, mingo@redhat.com, bp@alien8.de, hpa@zytor.com, 
	hannes@cmpxchg.org, mhocko@kernel.org, qi.zheng@linux.dev, shakeel.butt@linux.dev, 
	kasong@tencent.com, baohua@kernel.org, axelrasmussen@google.com, yuanchu@google.com, 
	weixugc@google.com, ryabinin.a.a@gmail.com, glider@google.com, andreyknvl@gmail.com, 
	dvyukov@google.com, vincenzo.frascino@arm.com, anshuman.khandual@arm.com, 
	yang@os.amperecomputing.com, chaitanyas.prakash@arm.com, ardb@kernel.org, guoren@kernel.org, 
	yang.li85200@gmail.com, viro@zeniv.linux.org.uk, dinguyen@kernel.org, 
	schuster.simon@siemens-energy.com, wangruikang@iscas.ac.cn, junhui.liu@pigmoral.tech, 
	muchun.song@linux.dev, vishal.moola@gmail.com, namcao@linutronix.de, pavel@kernel.org, 
	djbw@kernel.org, yu-cheng.yu@intel.com, baolu.lu@linux.intel.com, 
	Jonathan.Cameron@huawei.com, coxu@redhat.com, andreas@gaisler.com, liam@infradead.org, 
	vbabka@kernel.org, surenb@google.com, mhocko@suse.com, geert@linux-m68k.org, 
	shorne@gmail.com, jonas@southpole.se, stefan.kristiansson@saunalahti.fi
Subject: Re: [RFC PATCH 02/34] ARM: mm: make 2-level pgd_t a scalar
Message-ID: <alYL7B0HAvmLVHGU@pedro-suse>
References: <20260713135614.1618183-1-yeoreum.yun@arm.com>
 <20260713135614.1618183-3-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260713135614.1618183-3-yeoreum.yun@arm.com>
X-Spamd-Result: default: False [-2.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,vger.kernel.org,lists.linux.dev,kernel.org,kvack.org,googlegroups.com,lists.linux-m68k.org,armlinux.org.uk,linux-foundation.org,oracle.com,gmail.com,xen0n.name,loongson.cn,aosc.io,alpha.franken.de,ziepe.ca,arm.com,arndb.de,soleen.com,linux.ibm.com,linux.alibaba.com,brainfault.org,linux.dev,dabbelt.com,eecs.berkeley.edu,ghiti.fr,linux.intel.com,infradead.org,redhat.com,alien8.de,zytor.com,cmpxchg.org,tencent.com,google.com,os.amperecomputing.com,zeniv.linux.org.uk,siemens-energy.com,iscas.ac.cn,pigmoral.tech,linutronix.de,intel.com,huawei.com,gaisler.com,suse.com,linux-m68k.org,southpole.se,saunalahti.fi];
	R_RATELIMIT(0.00)[to_ip_from(RLdozb9qxkmspn1ke6sq1inr93)];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[95];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,imap1.dmz-prg2.suse.org:helo]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_032635_238273_1765523F 
X-CRM114-Status: GOOD (  23.48  )
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

On Mon, Jul 13, 2026 at 02:55:41PM +0100, Yeoreum Yun wrote:
> From: "David Hildenbrand (Arm)" <david@kernel.org>
> 
> We don't want pgd_t to be an array, as it prohibits returning it from a
> function, like pgdp_get().
> 
> So let's just use an u64, and extract the right 32bit value in
> pgd_val().
> 
> Leave the STRICT_MM_TYPECHECKS case alone for now.

I have to ask: is there a good reason for the STRICT_MM_TYPECHECKS ifdef?

I see the compiler has an awkward time returning a u64 struct (see
https://godbolt.org/z/qejbv6j9a), but if this doesn't work maybe we should
get rid of the STRICT_MM_TYPECHECKS stuff? I seriously doubt anyone is
purposefully toggling it on for testing from time to time.

If STRICT_MM_TYPEDEFS's worse codegen doesn't matter then maybe we should
permanently toggle it on.
> 
> As an alternative, we could use the STRICT_MM_TYPECHECKS approach here
> as well, but using an u64 looks conceptually cleaner, even though
> pgd_val() gets a bit more involved.
> 
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
>  arch/arm/include/asm/pgtable-2level-types.h | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/include/asm/pgtable-2level-types.h b/arch/arm/include/asm/pgtable-2level-types.h
> index 650e793f41429..02052cef9437a 100644
> --- a/arch/arm/include/asm/pgtable-2level-types.h
> +++ b/arch/arm/include/asm/pgtable-2level-types.h
> @@ -25,7 +25,7 @@ typedef struct { pteval_t pgprot; } pgprot_t;
>  
>  #define pte_val(x)      ((x).pte)
>  #define pmd_val(x)      ((x).pmd)
> -#define pgd_val(x)	((x).pgd[0])
> +#define pgd_val(x)      ((x).pgd[0])
>  #define pgprot_val(x)   ((x).pgprot)
>  
>  #define __pte(x)        ((pte_t) { (x) } )
> @@ -36,14 +36,21 @@ typedef struct { pteval_t pgprot; } pgprot_t;
>  /*
>   * .. while these make it easier on the compiler
>   */
> +typedef u64 pgdval_t;
> +
>  typedef pteval_t pte_t;
>  typedef pmdval_t pmd_t;
> -typedef pmdval_t pgd_t[2];
> +typedef pgdval_t pgd_t;
>  typedef pteval_t pgprot_t;
>  
>  #define pte_val(x)      (x)
>  #define pmd_val(x)      (x)
> -#define pgd_val(x)	((x)[0])
> +
> +static inline pmdval_t pgd_val(pgd_t pgd)
> +{
> +	return (*(pmdval_t (*)[2])&pgd)[0];

Ugh. This isn't correct C code. It only works because the kernel passes
-fno-strict-aliasing. I would recommend either forcing a struct here, or
using a u64 with bitmasks/shifts.

-- 
Pedro

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
