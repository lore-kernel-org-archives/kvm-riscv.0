Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7A31C36005
	for <kvm-riscv@archiver.kernel.org>; Tue, 25 Mar 2025 13:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G6ZOrS3qStbvmn58nWf8RMuRYVfCCwAyhCaELJzEDaU=; b=2rdXDWCkdQqS8w
	BUtIT3Kj9Pl6ilFFcBFvcAj38afBwCd34oZM66D66ooUIMELNdLWBEufmMF9j0lrcLPZNTvPsBkfN
	4f65zdefWJjA9x1qkoUWRRIguSG1IrAk9HYDgS6z3AqlYccv9lFKGZXwWTTWuCRe9eKDoHuNg97aX
	xGw+vqJfUM2PURiHGYUdT5mfkqRI2pSxkWUlyx1gEsQp20PaB6xdme0mOaf43/kQGr7VU3REDqVIM
	RfJtjZClACsBDA97oBFtT8eZUOIFqC5tIKLNn/aa6ZNY2hSaqHG2nq1XSkUxnO79B1z4pZRo1vFNz
	CB9dRFbUAHCLtzm0rG+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx46h-00000005zrw-1T0a;
	Tue, 25 Mar 2025 13:14:15 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx46e-00000005zr0-3eES;
	Tue, 25 Mar 2025 13:14:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F3B09A4943B;
	Tue, 25 Mar 2025 13:08:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80E71C4CEF7;
	Tue, 25 Mar 2025 13:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742908451;
	bh=7bzJUIwY16l63QfKJmsiupVF7IYNqpkd3IzG9gYAALc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NyPrZX2zvYx4m3VH9Fc1wiiQCHtp81BxhFIgJErfM1e6iK8yvSerc4sfbMDBzx1kQ
	 QplIQZnPOseIWFkTXjK02uSDnGG6Uzq1AYv5KPHeujZiOAlbpwn4SbWEHhmX/gy469
	 fFXR2na2foa9uxqRXn9AF0M+fongqdtMQAsDD80dHI5sfoaBLx23YVNceFsMWYKaVs
	 C7/p11hnQkANTPBqtf0OU6Q+v+kaVBZb6VFrZLAR7m0krBlnMAO88LNmzTdnsOfaKI
	 VpbZ0yXg04wccCBO9NlBypwixYU1z2XvmV1vo+KcGfLfjl1MuRnqI83HTSb88ieULT
	 G+VRbIUrF/dSg==
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4394a823036so56251745e9.0;
        Tue, 25 Mar 2025 06:14:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV0OJFDEgsZgypN1HHCdJ0+4SrelRwV+qHZ3JjT6qx50r2CYNuVALkTSCXYsHWVEntCXW0vKN3hi1c=@lists.infradead.org, AJvYcCXIfINhGtWS7J5fjJQdSnjZeB/DRmczoPo3eYVXdfuI3sm3aGFmmgfBkYpM1qZtOgh76Y9aCRQlpr8rGk0=@lists.infradead.org, AJvYcCXtxEdekyxDMaDBvcgHDVlhY0rk4f5XbFGzT4SeYTbj/APe+c/T1zFsZUdin7IYyOjUhv4cOnvbdPpCYg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxaGuGs2fXzU+2pF5KTZf3fkRiOGQIwF287G+4SPo9jIwRjNqB7
	23JdimX9WGYHOxM5NmB6Ma9//welj0Rqg0qL4V72NUskJ9/+E2rS/6VaP6g6AxwbKglexsjdy9a
	e+yrONutcthMIyAcPTSTOfA9Q9SM=
X-Google-Smtp-Source: AGHT+IGfKexksGgX0maV0KTcsKLOGrgVH5YKmlbhOfh8iEjwSz3eKgWZcomNnjiD6N1+SrsmiEpO9V65lbI9UvtGx1A=
X-Received: by 2002:a5d:59a2:0:b0:38f:6287:6474 with SMTP id
 ffacd0b85a97d-3997f8fc43dmr15193020f8f.15.1742908449922; Tue, 25 Mar 2025
 06:14:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250325121624.523258-1-guoren@kernel.org> <20250325122640.GK36322@noisy.programming.kicks-ass.net>
In-Reply-To: <20250325122640.GK36322@noisy.programming.kicks-ass.net>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 25 Mar 2025 21:13:57 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRfo-JuGtCJvZKAFJ0BAEzdqe83TvccCKM54BL0NQHHJw@mail.gmail.com>
X-Gm-Features: AQ5f1JorUn_mZoEMhlL0Xe-AITZgnQPYbvOfeukBw1Vy-vsynC2mh-QB0cq8pe8
Message-ID: <CAJF2gTRfo-JuGtCJvZKAFJ0BAEzdqe83TvccCKM54BL0NQHHJw@mail.gmail.com>
Subject: Re: [RFC PATCH V3 00/43] rv64ilp32_abi: Build CONFIG_64BIT
 kernel-self with ILP32 ABI
To: Peter Zijlstra <peterz@infradead.org>
Cc: arnd@arndb.de, gregkh@linuxfoundation.org, torvalds@linux-foundation.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, anup@brainfault.org, 
	atishp@atishpatra.org, oleg@redhat.com, kees@kernel.org, tglx@linutronix.de, 
	will@kernel.org, mark.rutland@arm.com, brauner@kernel.org, 
	akpm@linux-foundation.org, rostedt@goodmis.org, edumazet@google.com, 
	unicorn_wang@outlook.com, inochiama@outlook.com, gaohan@iscas.ac.cn, 
	shihua@iscas.ac.cn, jiawei@iscas.ac.cn, wuwei2016@iscas.ac.cn, drew@pdp7.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, ctsai390@andestech.com, 
	wefu@redhat.com, kuba@kernel.org, pabeni@redhat.com, josef@toxicpanda.com, 
	dsterba@suse.com, mingo@redhat.com, boqun.feng@gmail.com, 
	xiao.w.wang@intel.com, qingfang.deng@siflower.com.cn, leobras@redhat.com, 
	jszhang@kernel.org, conor.dooley@microchip.com, samuel.holland@sifive.com, 
	yongxuan.wang@sifive.com, luxu.kernel@bytedance.com, david@redhat.com, 
	ruanjinjie@huawei.com, cuiyunhui@bytedance.com, wangkefeng.wang@huawei.com, 
	qiaozhe@iscas.ac.cn, ardb@kernel.org, ast@kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-mm@kvack.org, 
	linux-crypto@vger.kernel.org, bpf@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-arch@vger.kernel.org, maple-tree@lists.infradead.org, 
	linux-trace-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-atm-general@lists.sourceforge.net, linux-btrfs@vger.kernel.org, 
	netfilter-devel@vger.kernel.org, coreteam@netfilter.org, 
	linux-nfs@vger.kernel.org, linux-sctp@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-media@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_061413_042753_68E45A93 
X-CRM114-Status: GOOD (  15.03  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBNYXIgMjUsIDIwMjUgYXQgODoyN+KAr1BNIFBldGVyIFppamxzdHJhIDxwZXRlcnpA
aW5mcmFkZWFkLm9yZz4gd3JvdGU6Cj4KPiBPbiBUdWUsIE1hciAyNSwgMjAyNSBhdCAwODoxNTo0
MUFNIC0wNDAwLCBndW9yZW5Aa2VybmVsLm9yZyB3cm90ZToKPiA+IEZyb206ICJHdW8gUmVuIChB
bGliYWJhIERBTU8gQWNhZGVteSkiIDxndW9yZW5Aa2VybmVsLm9yZz4KPiA+Cj4gPiBTaW5jZSAy
MDAxLCB0aGUgQ09ORklHXzY0QklUIGtlcm5lbCBoYXMgYmVlbiBidWlsdCB3aXRoIHRoZSBMUDY0
IEFCSSwKPiA+IGJ1dCB0aGlzIHBhdGNoc2V0IGFsbG93cyB0aGUgQ09ORklHXzY0QklUIGtlcm5l
bCB0byB1c2UgYW4gSUxQMzIgQUJJCj4KPiBJJ20gdGhpbmtpbmcgeW91J3JlIGdvaW5nIHRvIGJl
IGZpbmRpbmcgYSBtZXRyaWMgdG9uIG9mIGFzc3VtcHRpb25zCj4gYWJvdXQgJ3Vuc2lnbmVkIGxv
bmcnIGJlaW5nIDY0Yml0IHdoZW4gNjRCSVQ9eSB0aHJvdWdob3V0IHRoZSBrZXJuZWwuCkxlc3Mg
dGhhbiB5b3UgaW1hZ2luZWQuIE1vc3QgY29kZSBpcyBjb21wYXRpYmxlIHdpdGggSUxQMzIgQUJJ
IGR1ZSB0bwp0aGUgQ09ORklHXzMyQklULiBJbiBteSBwcmFjdGljZSwgaXQncyBkZWVtZWQgYWNj
ZXB0YWJsZS4KCj4KPiBJIGtub3cgb2YgYSBjb3VwbGUgb2YgcGxhY2VzIHdoZXJlIDY0QklUIHdp
bGwgcmVzdWx0IGluIGRpZmZlcmVudCBtYXRoCj4gc3VjaCB0aGF0IGEgMzJiaXQgJ3Vuc2lnbmVk
IGxvbmcnIHdpbGwgdHJpdmlhbGx5IG92ZXJmbG93LgpJIHdvdWxkIGJlIGdyYXRlZnVsIGlmIHlv
dSBjb3VsZCBzaGFyZSBzb21lIHdpdGggbWUuCgo+Cj4gUGxlYXNlLCBkb24ndCBkbyB0aGlzLiBU
aGlzIGFkZHMgYSBzaWduaWZpY2FudCBtYWludGVuYW5jZSBidXJkZW4gb24gYWxsCj4gb2YgdXMu
ClRoZSA2NElMUDMyIEFCSSB3b3VsZCBiZWFyIHRoZSBtYWludGVuYW5jZSBidXJkZW4sIG5vdCB0
cmFkaXRpb25hbAo2NC1iaXQgb3IgMzItYml0IEFCSXMuIFRoZSBwYXRjaCBzZXQgd29uJ3QgaW1w
YWN0IG90aGVyIENPTkZJR182NEJJVApvciBDT05GSUdfMzJCSVQuIE51bWVyb3VzIFJWNjQgY2hp
cHMgcmVxdWlyZSB0aGUgUlY2NElMUDMyIEFCSSB0bwpyZWR1Y2UgdGhlIG1lbW9yeSBhbmQgY2Fj
aGUgZm9vdHByaW50OyB3ZSB3aWxsIGJlYXIgdGhlIGJ1cmRlbi4gVGhlCmNvcmUgY29kZSBtYWlu
dGFpbmVycyB3b3VsZCByZWNlaXZlIHBhdGNoZXMgdGhhdCB3b3VsZCBtYWtlIHRoZW0gdXNlCkJJ
VFNfUEVSX0xPTkcgYW5kIENPTkZJR182NEJJVCBtb3JlIGFjY3VyYXRlbHkuCgotLSAKQmVzdCBS
ZWdhcmRzCiBHdW8gUmVuCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2t2bS1yaXNjdgo=
