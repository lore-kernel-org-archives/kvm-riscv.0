Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 657B9C3600D
	for <kvm-riscv@archiver.kernel.org>; Wed, 26 Mar 2025 06:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=1oQFlQS5pfXqN8PRyJuSqcFa91MlNpXLhRXfHoGgr4E=; b=0ODZ2CNFgUSlGg51pqzNK5+OAM
	NgVpVWRezDCptl1DA38oCfiXNOXdk/OHS9gdjyWHoVX5tjxaLu4B1fjPhE4YonrcXerRcompvSI1x
	TeqcyaTPz+V+Mt4/Ji78/13f3LjrUTij3pp6KWps83Zs0lKBY59URb1z9NF2Lli7X1BdMlSP4KONO
	5xpwivguztomh1U2MqGkkkD8+3WFS140C0H42WbvE+yc00J+NsybTU8pwr4QNY9B/I+nC2UXpzV/f
	4nxt8CNCF6YBaLxkvxrOv6IT2oPBMejJQqHrFgHqGsNfZL5VWKzT8ooQAZyXkkra3r3oi4qYdVUzW
	mj9MI3iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txKiY-00000007iLg-0f1y;
	Wed, 26 Mar 2025 06:58:26 +0000
Received: from flow-b6-smtp.messagingengine.com ([202.12.124.141])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txKgc-00000007hoJ-3SEc;
	Wed, 26 Mar 2025 06:56:28 +0000
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailflow.stl.internal (Postfix) with ESMTP id EE8A31D41505;
	Wed, 26 Mar 2025 02:56:23 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-07.internal (MEProxy); Wed, 26 Mar 2025 02:56:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1742972183;
	 x=1742979383; bh=ECmdnGpGt7R784A69CvkoNMp+aXiuLAMl/bxf3OLtmI=; b=
	kDfp1JcOTJJTTyJssul1zn/CcQe7Itgl8uG+6lVBUWsy5Y84lTm/Dj6eIDlIWV0W
	zx302OMerzA0hE/ghjdyqnHuYzSlRy2kdVTM0KueelvnPp3NpbSFt0oRiFoaXzbO
	lWuYvEaCj5qKK6Zc6IizJO2AQYpns+Yd/8wvdazYa61rmm0JlGYgC4pxo6X2Pbc6
	WYVmF3Eh2RWWiOwdhhVTmXz3m8DQw0UvAu8HD+eG7/sESegP1qryjfZk+QkuAw7m
	HfYcEzO0L5sZdQ0ZORPc65EuP3iJHCAwRPY2/VIMBsbh+vU0EAlP8jrUV2S3Zrmm
	TPYH7Y3dwHkVBI2+mC8P2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1742972183; x=
	1742979383; bh=ECmdnGpGt7R784A69CvkoNMp+aXiuLAMl/bxf3OLtmI=; b=L
	wLKFnjcxtSj11hlHzYXkPz+saypP392BUg14l9VmeGcPzntpMEUqG8V0uW/IqpeG
	+o9xK5wFshKTDRWmwcqM9eFjgEyVB+pWkVVHX8PuA69DzmjH6KhpOrcDjGb9gR+4
	qr2hrziuvLkezI1G9bUpNct7YoeHTl4cpqTdeV8/MiGaJ+mYdj7SPlUo6IopFW77
	ZUUxHmcQiJrb3IYSLCFtYccBoRcd0rPQjv+MMoONgz10cyqNLlhz8gDN8QGkQi0b
	nxewlH+zU79n3ein3A1l94c1VzhzuCVNLzVXZ0SkrH5/McvKIx7gdDhGh9rBmkXu
	4XqH4uenW/vOkamVGjDNg==
X-ME-Sender: <xms:FKXjZ3lfvEqhexrfOs1Km3QS9H0QchSRKT7pxrgiwJyNE4ld5na-JQ>
    <xme:FKXjZ614fUmkTTIRXsbcONheR_6VvqjHTvSgJ1V2Y25qRaJUNIAOxsNzp_C3s4022
    rEEC3U06K5tscZfufE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduieegkeeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnegohfhorhgsihguuggvnhffohhmrghinhculdehtddtmden
    ucfjughrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeenucfhrhhomhepfdetrh
    hnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrght
    thgvrhhnpeffffeghffftdejvddutefhfeetiedthfegfeekheekhfejvefhleejhedvke
    ehteenucffohhmrghinhepgihrvhhmrdgtohhmnecuhfhorhgsihguuggvnhffohhmrghi
    nhepgihrvhhmrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohephedtpdhm
    ohguvgepshhmthhpohhuthdprhgtphhtthhopegtthhsrghifeeltdesrghnuggvshhtvg
    gthhdrtghomhdprhgtphhtthhopehmrghrkhdrrhhuthhlrghnugesrghrmhdrtghomhdp
    rhgtphhtthhopegrthhishhhphesrghtihhshhhprghtrhgrrdhorhhgpdhrtghpthhtoh
    epphhrrggshhgrkhgrrhdrmhgrhhgruggvvhdqlhgrugdrrhhjsegsphdrrhgvnhgvshgr
    shdrtghomhdprhgtphhtthhopegrnhhuphessghrrghinhhfrghulhhtrdhorhhgpdhrtg
    hpthhtoheptghuihihuhhnhhhuihessgihthgvuggrnhgtvgdrtghomhdprhgtphhtthho
    pehluhiguhdrkhgvrhhnvghlsegshihtvggurghntggvrdgtohhmpdhrtghpthhtohepph
    grlhhmvghrsegurggssggvlhhtrdgtohhmpdhrtghpthhtohepsghoqhhunhdrfhgvnhhg
    sehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:FKXjZ9ontEFdUQlHBRLuoIFov8IsMx82kLI7-1vglQTDE5q6HLu1_A>
    <xmx:FKXjZ_k_XuPmio5wP__7mW2udbI_FndqbtN3-3_1RTTtUaICeThZsQ>
    <xmx:FKXjZ123aqAe2ZlYipl6EA2hNckgh20keVxrF4kpjQfYxm9lxf69DA>
    <xmx:FKXjZ-s80F4OUBAul7kt0vPDCd2KNxRPtCtKNmyMqWwBUt1mdx8xgA>
    <xmx:F6XjZ7F44zI7NZjpN8u1MBByATI5rLDdjI3c4_fuQmfgDy1oUJmoph2E>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id DB88E2220072; Wed, 26 Mar 2025 02:56:19 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T218a0d8b70d1a53d
Date: Wed, 26 Mar 2025 07:55:17 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: guoren <guoren@kernel.org>
Cc: "Peter Zijlstra" <peterz@infradead.org>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Linus Torvalds" <torvalds@linux-foundation.org>,
 "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Anup Patel" <anup@brainfault.org>,
 "Atish Patra" <atishp@atishpatra.org>, "Oleg Nesterov" <oleg@redhat.com>,
 "Kees Cook" <kees@kernel.org>, "Thomas Gleixner" <tglx@linutronix.de>,
 "Will Deacon" <will@kernel.org>, "Mark Rutland" <mark.rutland@arm.com>,
 "Christian Brauner" <brauner@kernel.org>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Steven Rostedt" <rostedt@goodmis.org>,
 "Eric Dumazet" <edumazet@google.com>,
 "Chen Wang" <unicorn_wang@outlook.com>,
 "Inochi Amaoto" <inochiama@outlook.com>, gaohan@iscas.ac.cn,
 shihua@iscas.ac.cn, jiawei@iscas.ac.cn, wuwei2016@iscas.ac.cn,
 "Drew Fustini" <drew@pdp7.com>, "Lad,
 Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 ctsai390@andestech.com, wefu@redhat.com,
 "Jakub Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>,
 "Josef Bacik" <josef@toxicpanda.com>, "David Sterba" <dsterba@suse.com>,
 "Ingo Molnar" <mingo@redhat.com>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Xiao W Wang" <xiao.w.wang@intel.com>, qingfang.deng@siflower.com.cn,
 "Leonardo Bras" <leobras@redhat.com>,
 "Jisheng Zhang" <jszhang@kernel.org>,
 "Conor.Dooley" <conor.dooley@microchip.com>,
 "Samuel Holland" <samuel.holland@sifive.com>, yongxuan.wang@sifive.com,
 "Xu Lu" <luxu.kernel@bytedance.com>,
 "David Hildenbrand" <david@redhat.com>,
 "Ruan Jinjie" <ruanjinjie@huawei.com>,
 "Yunhui Cui" <cuiyunhui@bytedance.com>,
 "Kefeng Wang" <wangkefeng.wang@huawei.com>, qiaozhe@iscas.ac.cn,
 "Ard Biesheuvel" <ardb@kernel.org>,
 "Alexei Starovoitov" <ast@kernel.org>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-mm@kvack.org,
 linux-crypto@vger.kernel.org, bpf@vger.kernel.org,
 linux-input@vger.kernel.org, linux-perf-users@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Linux-Arch <linux-arch@vger.kernel.org>, maple-tree@lists.infradead.org,
 linux-trace-kernel@vger.kernel.org, Netdev <netdev@vger.kernel.org>,
 linux-atm-general@lists.sourceforge.net, linux-btrfs@vger.kernel.org,
 netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
 linux-nfs@vger.kernel.org, linux-sctp@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-media@vger.kernel.org
Message-Id: <a9dddc3d-d03d-4614-9d55-1ce48c6ad5ef@app.fastmail.com>
In-Reply-To: <CAJF2gTSHpZMyUk+8HL0=bevCd4XZYRAkrPM600qLPCKxG+bfrg@mail.gmail.com>
References: <20250325121624.523258-1-guoren@kernel.org>
 <20250325122640.GK36322@noisy.programming.kicks-ass.net>
 <db3c9923-8800-4ed3-a352-4ee9ef79c0b7@app.fastmail.com>
 <CAJF2gTSHpZMyUk+8HL0=bevCd4XZYRAkrPM600qLPCKxG+bfrg@mail.gmail.com>
Subject: Re: [RFC PATCH V3 00/43] rv64ilp32_abi: Build CONFIG_64BIT kernel-self with
 ILP32 ABI
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_235627_406173_DBA1D2DA 
X-CRM114-Status: GOOD (  34.70  )
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

T24gV2VkLCBNYXIgMjYsIDIwMjUsIGF0IDA3OjA3LCBHdW8gUmVuIHdyb3RlOgo+IE9uIFR1ZSwg
TWFyIDI1LCAyMDI1IGF0IDk6MTjigK9QTSBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPiB3
cm90ZToKPj4gT24gVHVlLCBNYXIgMjUsIDIwMjUsIGF0IDEzOjI2LCBQZXRlciBaaWpsc3RyYSB3
cm90ZToKPj4gPiBPbiBUdWUsIE1hciAyNSwgMjAyNSBhdCAwODoxNTo0MUFNIC0wNDAwLCBndW9y
ZW5Aa2VybmVsLm9yZyB3cm90ZToKPj4KPj4gWW91IGRlY2xhcmUgdGhlIHN5c2NhbGwgQUJJIHRv
IGJlIHRoZSBuYXRpdmUgNjQtYml0IEFCSSwgYnV0IHRoaXMKPj4gaXMgZnVuZGFtZW50YWxseSBu
b3QgdHJ1ZSBiZWNhdXNlIGEgbWFueSB1YXBpIHN0cnVjdHVyZXMgYXJlCj4+IGRlZmluZWQgaW4g
dGVybXMgb2YgJ2xvbmcnIG9yIHBvaW50ZXIgdmFsdWVzLCBpbiBwYXJ0aWN1bGFyIGluCj4+IHRo
ZSBpb2N0bCBjYWxsLgo+Cj4gSSBtb2RpZmllZCB1YXBpIHdpdGgKPiB2b2lkIF9fdXNlciAqbXNn
X25hbWU7Cj4gLT4KPiB1bmlvbiB7dm9pZCBfX3VzZXIgKm1zZ19uYW1lOyB1NjQgX19tc2dfbmFt
ZTt9Owo+IHRvIG1ha2UgbmF0aXZlIDY0LWJpdCBBQkkuCj4KPiBJIHdvdWxkIGxvb2sgYXQgY29t
cGF0IHN0dWZmIGluc3RlYWQgb2YgdXNpbmcgX19yaXNjdl94bGVuIG1hY3JvLgoKVGhlIHByb2Js
ZW0gSSBzZWUgaGVyZSBpcyB0aGF0IHRoZXJlIGFyZSBtYW55IG1vcmUgZHJpdmVycwp0aGF0IHlv
dSBkaWQgbm90IG1vZGlmeSB0aGFuIGRyaXZlcnMgdGhhdCB5b3UgZGlkIGNoYW5nZSB0aGlzCndh
eS4gIFRoZSB1bmlvbiBpcyBwYXJ0aWN1bGFybHkgdWdseSwgYnV0IGV2ZW4gaWYgeW91IGZpbmQK
YSBuaWNlciBtZXRob2Qgb2YgZG9pbmcgdGhpcywgeW91IG5vdyBhbHNvIHB1dCB0aGUgYnVyZGVu
Cm9uIGZ1dHVyZSBkcml2ZXIgd3JpdGVycyB0byBkbyB0aGlzIHJpZ2h0IGZvciB5b3VyIHBsYXRm
b3JtLgoKPj4gQXMgZmFyIGFzIEkgY2FuIHRlbGwsIHRoZXJlIGlzIG5vIHdheSB0byByZWN0aWZ5
IHRoaXMgZGVzaWduIGZsYXcKPj4gb3RoZXIgdGhhbiB0byBkcm9wIHN1cHBvcnQgZm9yIDY0LWJp
dCB1c2Vyc3BhY2UgYW5kIG9ubHkgc3VwcG9ydAo+PiByZWd1bGFyIHJ2MzIgdXNlcnNwYWNlLiBJ
J20gYWxzbyBza2VwdGljYWwgdGhhdCBzdXBwb3J0aW5nIHJ2NjQKPj4gdXNlcnNwYWNlIGhlbHBz
IGluIHByYWN0aWNlIG90aGVyIHRoYW4gZm9yIHRlc3RpbmcsIHNpbmNlCj4+IGdlbmVyYWxseSBt
b3N0IG1lbW9yeSBvdmVyaGVhZCBpcyBpbiB1c2Vyc3BhY2UgcmF0aGVyIHRoYW4gdGhlCj4+IGtl
cm5lbCwgYW5kIHRoZXJlIGlzIG11Y2ggbW9yZSB0byBnYWluIGZyb20gc2hyaW5raW5nIHRoZSBs
YXJnZXIKPj4gdXNlcnNwYWNlIGJ5IHJ1bm5pbmcgcnYzMiBjb21wYXQgbW9kZSBiaW5hcmllcyBv
biBhIDY0LWJpdCBrZXJuZWwKPj4gdGhhbiB0aGUgb3RoZXIgd2F5IHJvdW5kLgo+Cj4gVGhlIGxw
NjQtYWJpIHVzZXJzcGFjZSByb290ZnMgd29ya3MgZmluZSBpbiB0aGlzIHBhdGNoIHNldCwgd2hp
Y2gKPiBwcm92ZXMgdGhlIHRlY2huaXF1ZSBpcyB2YWxpZC4gQnV0IHRoZSBtb2RpZmljYXRpb24g
b24gdWFwaSBpcyByYXcsCj4gYW5kIEknbSBsb29raW5nIGF0IGNvbXBhdCBzdHVmZi4KClRoZXJl
IGlzIGEgYmlnIGRpZmZlcmVuY2UgYmV0d2VlbiBtYWtpbmcgaXQgd29yayBmb3IgYSBwYXJ0aWN1
bGFyCnNldCBvZiB1c2Vyc3BhY2UgYmluYXJpZXMgYW5kIG1ha2luZyBpdCBjb3JyZWN0IGZvciB0
aGUgZW50aXJlCmtlcm5lbCBBQkkuCgpJIGFncmVlIHRoYXQgbGltaXRpbmcgdGhlIGhhY2tzIHRv
IHRoZSBjb21wYXQgc2lkZSB3aGlsZSBrZWVwaW5nCnRoZSBuYXRpdmUgQUJJIGFzIGlscDMyIGFz
IGluIHlvdXIgcHJldmlvdXMgdmVyc2lvbnMgaXMgYmV0dGVyLApidXQgSSBhbHNvIGRvbid0IHRo
aW5rIHRoaXMgY2FuIGJlIGVhc2lseSBkb25lIHdpdGhvdXQgbWFqb3IKY2hhbmdlcyB0byBob3cg
Y29tcGF0IG1vZGUgd29ya3MgaW4gZ2VuZXJhbCwgYW5kIHRoYXQgc3RpbGwKc2VlbXMgbGlrZSBh
IHNob3ctc3RvcHBlciBmb3IgdHdvIHJlYXNvbnM6CgotIGl0IHN0aWxsIHB1dHMgdGhlIGJ1cmRl
biBvbiBkcml2ZXIgd3JpdGVycyB0byBnZXQgaXQgcmlnaHQKICBmb3IgeW91ciBwbGF0Zm9ybS4g
VGhlIHNjb3BlIGlzIGEgYml0IHNtYWxsZXIgdGhhbiBpbiB0aGUKICBjdXJyZW50IHZlcnNpb24g
YmVjYXVzZSB0aGF0IHdvdWxkIGJlIGxpbWl0ZWQgdG8gdGhlIGNvbXBhdAogIGhhbmRsZXJzIGFu
ZCBub3QgY2hhbmdlIHRoZSBuYXRpdmUgY29kZXBhdGgsIGJ1dCB0aGF0J3MKICBzdGlsbCBhIGxv
dCBvZiBkcml2ZXJzLgoKLSB0aGUgd2F5IHRoYXQgSSB3b3VsZCBpbWFnaW5lIHRoaXMgdG8gYmUg
aW1wbGVtZW50ZWQgaW4KICBwcmFjdGljZSB3b3VsZCByZXF1aXJlIGNoYW5naW5nIHRoZSBjb21w
YXQgY29kZSBpbiBhIHdheSB0aGF0CiAgYWxsb3dzIG11bHRpcGxlIGNvbXBhdCBBQklzLCBzbyBk
cml2ZXJzIGNhbiBzZXBhcmF0ZSB0aGUKICBub3JtYWwgMzItb24tNjQgaGFuZGxpbmcgZnJvbSB0
aGUgNjQtb24tMzIgdmVyc2lvbiB5b3UgbmVlZC4KICBXZSBoYXZlIGRpc2N1c3NlZCBzb21ldGhp
bmcgbGlrZSB0aGlzIGluIHRoZSBwYXN0LCBidXQgTGludXMKICBoYXMgYWxyZWFkeSBtYWRlIGl0
IHZlcnkgY2xlYXIgdGhhdCBoZSBkb2Vzbid0IHdhbnQgaXQgZG9uZQogIHRoYXQgd2F5LiBXaGlj
aGV2ZXIgd2F5IHlvdSBkbyBpdCwgdGhpcyBpcyB1bmxpa2VseSB0bwogIGZpbmQgY29uc2Vuc3Vz
LiAgCgo+IFN1cHBvcnRpbmcgbHA2NC1hYmkgdXNlcnNwYWNlIGlzIGVzc2VudGlhbCBiZWNhdXNl
IHJpc2N2IGxwNjQtYWJpIGFuZAo+IGlscDMyLWFiaSB1c2Vyc3BhY2UgYXJlIGh5YnJpZCBkZXBs
b3ltZW50cyB3aGVuIHRoZSB0YXJnZXQgaXMKPiBpbHAzMi1hYmkgdXNlcnNwYWNlLiBUaGUgbHA2
NC1hYmkgcHJvdmlkZXMgYSBnb29kIHN1cHBsZW1lbnQgdG8KPiBpbHAzMi1hYmkgd2hpY2ggZWFz
ZXMgdGhlIGRldmVsb3BtZW50LgoKSSdtIG5vdCBmb2xsb3dpbmcgaGVyZSwgcGxlYXNlIGNsYXJp
ZnkuIEkgZG8gdW5kZXJzdGFuZCB0aGF0CmhhdmluZyBhIG1peGVkIDMyLzY0IHVzZXJzcGFjZSBj
YW4gaGVscCBmb3IgZGV2ZWxvcG1lbnQsIGJ1dAp0aGF0IGNhbiBhbHJlYWR5IGJlIGRvbmUgb24g
YSA2NC1iaXQga2VybmVsIGFuZCBpdCBkb2Vzbid0CnNlZW0gdG8gYmUgdXNlZnVsIGZvciBkZXBs
b3ltZW50IGJlY2F1c2UgaGF2aW5nIHR3byBzZXRzIG9mCnN1cHBvcnQgbGlicmFyaWVzIG1ha2Vz
IHRoaXMgY291bnRlcnByb2R1Y3RpdmUgZm9yIHRoZSBnb2FsCm9mIHNhdmluZyBSQU0uCgo+PiBJ
ZiB5b3UgcmVtb3ZlIHRoZSBDT05GSUdfNjRCSVQgY2hhbmdlcyB0aGF0IFBldGVyIG1lbnRpb25l
ZCBhbmQKPj4gdGhlIHN1cHBvcnQgZm9yIGlscDY0IHVzZXJsYW5kIGZyb20geW91ciBzZXJpZXMs
IHlvdSBlbmQgdXAKPj4gd2l0aCBhIGtlcm5lbCB0aGF0IGlzIHZlcnkgc2ltaWxhciB0byBhIG5h
dGl2ZSBydjMyIGtlcm5lbAo+PiBidXQgZXhlY3V0ZXMgYXMgcnY2NGlscDMyIGFuZCBydW5zIHJ2
MzIgdXNlcnNwYWNlLiBJIGRvbid0IGhhdmUKPj4gYW55IG9iamVjdGlvbnMgdG8gdGhhdCBhcHBy
b2FjaCwgYW5kIHRoZSBzYW1lIHRoaW5nIGhhcyBjb21lCj4+IHVwIG9uIGFybTY0IGFzIGEgcG9z
c2libGUgaWRlYSBhcyB3ZWxsLCBidXQgSSBkb24ndCBrbm93IGlmCj4+IHRoYXQgYWN0dWFsbHkg
YnJpbmdzIGFueSBub3RhYmxlIGFkdmFudGFnZSBvdmVyIGFuIHJ2MzIga2VybmVsLgo+Pgo+PiBB
cmUgdGhlcmUgQ1BVcyB0aGF0IGNhbiBydW4gcnY2NCBrZXJuZWxzIGFuZCBydjMyIHVzZXJzcGFj
ZQo+PiBidXQgbm90IHJ2MzIga2VybmVscywgc2ltaWxhciB0byB3aGF0IHdlIGhhdmUgb24gQXJt
IENvcnRleC1BNzYKPj4gYW5kIENvcnRleC1BNTEwPwo+Cj4gWWVzLCB0aGVyZSBpcywgYW5kIGl0
IG9ubHkgc3VwcG9ydHMgcnYzMiB1c2Vyc3BhY2UsIG5vdCBydjMyIGtlcm5lbC4KPiBodHRwczov
L3d3dy54cnZtLmNvbS9wcm9kdWN0L3h1YW50aWUvQzkwOAoKT2ssIHRoYW5rcyBmb3IgdGhlIGxp
bmsuCgogICAgICAgQXJuZAoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9rdm0tcmlzY3YK
