Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5479CD98D2
	for <kvm-riscv@archiver.kernel.org>; Tue, 16 Jun 2026 06:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6Ej4XTuNyFBFor9BuTTzjdPxZprRVZKo5YRCjadjqec=; b=ujgQt3li+pCLov
	oitmPPtuOdQo+VX5Q8dHm81qr/iUGRWqfhFZ/Hmh2nEmc8y8xKaQNJTw0o8jynwirCYOMNI9WX1Vl
	OxmcYXTEccHujWel2GinGd+Nm1xylD940TOyWer1sWm7MBaAI8itvTag0mdzF9yjCNQr9xaa84tDg
	3hzdWt77GyMXmRVxAXTXmuZtkuXsPAG7LrtKNlmVQiy9tk3gnjWMGZdV+G4XEIU873p0PsQAYHXr/
	aLhEFIwTrqveEQS7kw89C9o+5M96liNWA4W8+1MQKVaDNO7ejyT1t+Bezh2BTKDfdRH8GEnQXpIQQ
	1YELDP6e6ptfcKOk+jAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZMsL-0000000FHCK-1WQ6;
	Tue, 16 Jun 2026 06:02:17 +0000
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZMsJ-0000000FHBf-103J
	for kvm-riscv@lists.infradead.org;
	Tue, 16 Jun 2026 06:02:16 +0000
Received: by mail-dy1-x1332.google.com with SMTP id 5a478bee46e88-307631dbfedso8823413eec.0
        for <kvm-riscv@lists.infradead.org>; Mon, 15 Jun 2026 23:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781589734; x=1782194534; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1pI5rWxtEe50KjcsP0jF926SZexIl8kuuOKapFR5YRg=;
        b=QAccRqQCduxGPRvsQTx53WlGOx1A7O6L+buXDsC0JjjuCyzlpjBpGRJsMHGFYIi+mU
         IuKq1c8c1JHDeFOZP9ewoUYD18haJBaGFQaPMg73IMCs2Hu8UKqAZIC/0dfFahLntXyj
         OQs3hRkkPJXc2gupkj3fQ0APa+NZj0vpQ+Gtk79F5bB9ipEkzlLHVuS30ZC0iA5sIr+9
         F68lsF8T/u1RDc76yrpwbdsXepfikbqYfEbjxzke/GiNRGr7yJ3UpC/T7rK6R9XFnEee
         MkMjDpfoL6XUD4nUAaJw297+hzVmnMuPcO+vsr9WM9k+LxbUW9b6diZZmbugt/onmEqq
         oBNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781589734; x=1782194534;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1pI5rWxtEe50KjcsP0jF926SZexIl8kuuOKapFR5YRg=;
        b=fHLCw5+geg68kqUDNVvnlBuRoYehGlNVMesJG907rn7bIIEJY9bhmi6/sWDXmH3qaj
         ZAhbiR1m4QfK7cHpu3dvnaJ6BwWe1e5WemiBqGhvnoYDhe52bZDi04qKyogt4uscW963
         hZ9Ajfne4vcDmy8Jx9InD/bh2pnFWlAdARS+ZU11+c4tovOfsIbKxfvZBs3XFvo2rtqx
         xbcV85GTDeZ3PBwMxkstsmhJ/xk4kQehVMRSQ6rjHfi/ZgmSD+8B1wVhum93vgzh90p1
         ULYP0K3QFHbw3vvbVmccXpxqNcdpu9EH1V53ZHL7MIROTX8ujbiz8TvWK2LZw4IRVbmg
         NBDA==
X-Forwarded-Encrypted: i=1; AFNElJ9C0hkPph+TP/wicfO8HX1tBw6ZCdCKkKyY7G97Nl9jIA5mRh76dsSftNoNt8uOEfsB87enYn9djgw=@lists.infradead.org
X-Gm-Message-State: AOJu0YxiyvNKQoR24jIOyTYdpHNfu+OfRIMa5/LihtC35slhnEn2u9w+
	cYDp4QU8UAfv1ovBUmBc5jkJxTtZSEj+BwxGLX0EhAURtCgwv5n4P8XN
X-Gm-Gg: Acq92OF8ORkzxZvgOH9WGgenQfrfK2NK6BavXi+w1xwS59dyERiQ7LrrLSsgdV1z4kR
	dcvvzPtpAhegdIEOEzw4drK7+LhGtFBpSWOrP44U+JHno2qLokT4UYIa0+xCbCvphv+XanEXsl/
	KE317ndeuDNhhHuu9YexYGtHC667h9fWZdlTYpKlxrrv0+nlODTXhRjtS5QJcdjtFlk53Mq17mM
	b98I6uWobqLvr/lUZO5Ut9rIa6tZVVtICtZ2fKTkYu8hnK9XnkN0/WnPTgG0ZkkZuX6lN4DojFB
	Dz1fA3HqdfS7adGXYASMCywXCzgmxU9rCZ5AA0aB50K/0RcS+dAE6ExRa4u+VCndXV0mnRawPH2
	D8ubMkKHKwABIkqSk8GpvrGWr5fei+Cl9kgofvPivK1v6Rd9ld9cVDuQdBvq/bZCoNDVY2DjOQb
	0+vTMS5QlDhXc=
X-Received: by 2002:a05:7300:e882:b0:304:e2a5:689e with SMTP id 5a478bee46e88-30ba5989923mr1369233eec.2.1781589734142;
        Mon, 15 Jun 2026 23:02:14 -0700 (PDT)
Received: from blinky ([2601:647:6700:64d0::92d1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0357sm16552304eec.11.2026.06.15.23.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 23:02:13 -0700 (PDT)
Date: Mon, 15 Jun 2026 23:02:11 -0700
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
Subject: Re: [PATCH 03/16] riscv: kgdb: Use generated instruction headers
Message-ID: <ajDm49ucbj6mVRo9@blinky>
References: <20260407-riscv_insn_table-v1-0-54b4736a1e77@gmail.com>
 <20260407-riscv_insn_table-v1-3-54b4736a1e77@gmail.com>
 <87pl1xehi4.fsf@yellow.woof>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87pl1xehi4.fsf@yellow.woof>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_230215_299997_D8C5EC75 
X-CRM114-Status: UNSURE (   9.47  )
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

On Thu, Jun 11, 2026 at 08:08:35AM +0200, Nam Cao wrote:
> Charlie Jenkins via B4 Relay
> <devnull+thecharlesjenkins.gmail.com@kernel.org> writes:
> > +#define riscv_insn_branch(_insn, regs_ptr, _opcode, _pc, _comparison, type)     \
> > +	({                                                                      \
> > +		unsigned long _ret;                                             \
> > +		if ((type)riscv_insn_reg_get_val(                               \
> > +			    regs_ptr,                                           \
> > +			    riscv_insn_##_insn##_extract_xs1(_opcode))          \
> > +			    _comparison(type) riscv_insn_reg_get_val(           \
> > +				    regs_ptr,                                   \
> > +				    riscv_insn_##_insn##_extract_xs2(_opcode))) \
> > +			_ret = riscv_insn_##_insn##_extract_imm(_opcode);       \
> 
> Should be
> 		_ret = _pc + riscv_insn_##_insn##_extract_imm(_opcode);

Hmm I am surprised my test cases didn't catch that. Thank you!

- Charlie

> 
> > +		else                                                            \
> > +			_ret = _pc + 4;                                         \
> > +		_ret;                                                           \
> > +	})
> > +

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
