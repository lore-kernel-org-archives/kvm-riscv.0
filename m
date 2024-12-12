Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C258E7717F
	for <kvm-riscv@archiver.kernel.org>; Thu, 12 Dec 2024 13:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a3SGh6P8Sp+PgCVl3wRjXW+T/mSonPQeOnxwXQKlpX4=; b=ChCWBQ10/N23KU
	bCUpnL4wuy4RA8jbLby3wvC0+yK0gyeTuTnviq94ezTQJPJVBqSB2+QTqSaAZ6572f5guaIaLNq6G
	/dWf5APyhXf43c3Ldw+9Yt2q+3ApNPsupKIH8gF+3keB6hTGXawuMcAKt65U3UGwShyE+VLDzehw1
	M1IOY2kILjC4k0104HQDTVDLSFgzVnuT9sLbSAyvS90av/z8utj7zTKArTecbBEQ+FSmf1ZwhfTSW
	xHbfmV0rwDY4w473KVI81o1GwL4BdicpuXOeCVuh4c/FyM8oWd+hMedUHc/NAq1erqVBPxcdJwCtY
	LC5Cs0hs1tGGukUwWkQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLj78-00000000Tci-0yJ9;
	Thu, 12 Dec 2024 13:20:22 +0000
Received: from smtp-out1.suse.de ([195.135.223.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLj76-00000000TbV-2Cap;
	Thu, 12 Dec 2024 13:20:21 +0000
Received: from hawking.nue2.suse.org (unknown [IPv6:2a07:de40:a101:3:92b1:1cff:fe69:ddc])
	by smtp-out1.suse.de (Postfix) with ESMTP id BB45D21101;
	Thu, 12 Dec 2024 13:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1734009616; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=c/BWGvQPrZx2VHJH6gXJ70AF/i/mUx48F5PDLOR50PU=;
	b=G0+gJTnoNUBFKzXQ4WQdL/D4JqMKS8EvUtjFsiWsyUm2pLxNLogguxPwUo2ZeXJFBmlzkz
	fbThzBNsG1+RTFxx51a5DGee6Ph9hN35lTzzAQwhKqV2+YClrk/wODGK96uN2SeHTmDF+p
	tNAvs4XCtfSI0A7s+4ViFDLou/bg0mA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1734009616;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=c/BWGvQPrZx2VHJH6gXJ70AF/i/mUx48F5PDLOR50PU=;
	b=cuEiBk2+3CQcFyPi+Uu6D+a4mOnk4kxWb1z60nRnw4qTO0YlaBwz++/xEghS/mwF1Ji+rw
	nwAbqgS963ggK/CQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=G0+gJTno;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=cuEiBk2+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1734009616; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=c/BWGvQPrZx2VHJH6gXJ70AF/i/mUx48F5PDLOR50PU=;
	b=G0+gJTnoNUBFKzXQ4WQdL/D4JqMKS8EvUtjFsiWsyUm2pLxNLogguxPwUo2ZeXJFBmlzkz
	fbThzBNsG1+RTFxx51a5DGee6Ph9hN35lTzzAQwhKqV2+YClrk/wODGK96uN2SeHTmDF+p
	tNAvs4XCtfSI0A7s+4ViFDLou/bg0mA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1734009616;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=c/BWGvQPrZx2VHJH6gXJ70AF/i/mUx48F5PDLOR50PU=;
	b=cuEiBk2+3CQcFyPi+Uu6D+a4mOnk4kxWb1z60nRnw4qTO0YlaBwz++/xEghS/mwF1Ji+rw
	nwAbqgS963ggK/CQ==
Received: by hawking.nue2.suse.org (Postfix, from userid 17005)
	id 4187A4A05D9; Thu, 12 Dec 2024 14:20:16 +0100 (CET)
From: Andreas Schwab <schwab@suse.de>
To: Arnd Bergmann <arnd@kernel.org>
Cc: kvm@vger.kernel.org,  Arnd Bergmann <arnd@arndb.de>,  Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>,  Huacai Chen
 <chenhuacai@kernel.org>,  Jiaxun Yang <jiaxun.yang@flygoat.com>,  Michael
 Ellerman <mpe@ellerman.id.au>,  Nicholas Piggin <npiggin@gmail.com>,
  Christophe Leroy <christophe.leroy@csgroup.eu>,  Naveen N Rao
 <naveen@kernel.org>,  Madhavan Srinivasan <maddy@linux.ibm.com>,
  Alexander Graf <graf@amazon.com>,  Crystal Wood <crwood@redhat.com>,
  Anup Patel <anup@brainfault.org>,  Atish Patra <atishp@atishpatra.org>,
  Paul Walmsley <paul.walmsley@sifive.com>,  Palmer Dabbelt
 <palmer@dabbelt.com>,  Albert Ou <aou@eecs.berkeley.edu>,  Sean
 Christopherson <seanjc@google.com>,  Paolo Bonzini <pbonzini@redhat.com>,
  Thomas Gleixner <tglx@linutronix.de>,  Ingo Molnar <mingo@redhat.com>,
  Borislav Petkov <bp@alien8.de>,  Dave Hansen
 <dave.hansen@linux.intel.com>,  x86@kernel.org,  "H. Peter Anvin"
 <hpa@zytor.com>,  Vitaly Kuznetsov <vkuznets@redhat.com>,  David Woodhouse
 <dwmw2@infradead.org>,  Paul Durrant <paul@xen.org>,  Marc Zyngier
 <maz@kernel.org>,  linux-kernel@vger.kernel.org,
  linux-mips@vger.kernel.org,  linuxppc-dev@lists.ozlabs.org,
  kvm-riscv@lists.infradead.org,  linux-riscv@lists.infradead.org
Subject: Re: [RFC 1/5] mips: kvm: drop support for 32-bit hosts
In-Reply-To: <20241212125516.467123-2-arnd@kernel.org> (Arnd Bergmann's
	message of "Thu, 12 Dec 2024 13:55:12 +0100")
References: <20241212125516.467123-1-arnd@kernel.org>
	<20241212125516.467123-2-arnd@kernel.org>
Date: Thu, 12 Dec 2024 14:20:16 +0100
Message-ID: <mvm4j39ghrj.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Spamd-Result: default: False [2.59 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	HFILTER_HOSTNAME_UNKNOWN(2.50)[];
	RDNS_NONE(2.00)[];
	ONCE_RECEIVED(1.20)[];
	HFILTER_HELO_IP_A(1.00)[hawking.nue2.suse.org];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[hawking.nue2.suse.org];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_NO_TLS_LAST(0.10)[];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[35];
	DIRECT_TO_MX(0.00)[Gnus/5.13 (Gnus v5.13)];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,arndb.de,alpha.franken.de,kernel.org,flygoat.com,ellerman.id.au,gmail.com,csgroup.eu,linux.ibm.com,amazon.com,redhat.com,brainfault.org,atishpatra.org,sifive.com,dabbelt.com,eecs.berkeley.edu,google.com,linutronix.de,alien8.de,linux.intel.com,zytor.com,infradead.org,xen.org,lists.ozlabs.org,lists.infradead.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLrhtxphh58n7g1ptxk8ecsouj),from(RLajr16mudzow8bnf6sy)];
	RCVD_COUNT_ONE(0.00)[1];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid]
X-Spamd-Bar: ++
X-Rspamd-Queue-Id: BB45D21101
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_052020_710556_8A35A447 
X-CRM114-Status: UNSURE (   5.23  )
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

On Dez 12 2024, Arnd Bergmann wrote:

> KVM support on MIPS was added in 2012 with both 32-bit and 32-bit mode

s/32-bit/64-bit/ (once)

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
