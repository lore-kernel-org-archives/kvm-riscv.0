Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0612CCA471
	for <kvm-riscv@archiver.kernel.org>; Thu,  9 Oct 2025 06:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KPQyUWp4BDsl2PwgjZDcw6S/vfo4ry5p4epApE6vXcA=; b=jzglYuundAT/WL
	Zv7xrz6xFxk2tvDAKwly5mEYiP3TmxLTY33fkjJ63xcxwfy45Ard/D2z+NYA3WFvN5SpviwjcFFCY
	xeUa5o1F7xZts/7LE7Cpu08XbUe+A3lu2Ri0Xu7Z7n7xgAzILzDfy36d38zxpe5IGe07OAOyFduKX
	r+mLCjBc8GyvnTBpD1FhjHpXCLLaw6NFZQc1LGy0Pv2JVTFnKLiTJQktMo3AvomfX8GoHLyTUbrr8
	ERYQB+Xhqa2ut3nBfCarVkSe2wZED8jnI2zj08FSL/JqOjRx5tDIyYsaTaNve3MPIiUYKRPjBphsw
	AD4uRRMkEiUFHZOxvZ4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6kBn-00000005HYC-2WlT;
	Thu, 09 Oct 2025 06:31:47 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6kBl-00000005HX3-1pJw
	for kvm-riscv@lists.infradead.org;
	Thu, 09 Oct 2025 06:31:46 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-46e38c21fafso1159515e9.2
        for <kvm-riscv@lists.infradead.org>; Wed, 08 Oct 2025 23:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1759991503; x=1760596303; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZphDIVd5tmeP6KAhy58kJYA1PrGr3bDOHMWlYgqBwIY=;
        b=nYCPyRjZT7TKPwY3IOnRG7nY/t3Pe00iTBZFHaqVN6qKQf8+xaxBtlKcqIXOM5/Nfj
         IZDcSzAxeU6d0/ksaUUjM1hnG73HNb+e+JgUpcot9LFvox824HoXd306bQ8Lno8Qgulw
         DhUHRre8xN50vyAF/VbjdHrCDHpceEpKY8V32/O6WHUOeeYeauAi+wtEoLiqZ7QIjx0g
         u/clT8+7Q14bK/Ernpn+4NF95ooVx+GtbiDwA96FJgf6Yu4f0krHrKdStqwUwrbH/wCt
         2671+tMahTjGrXM0hcdE0JTrRJiwoYKrMRePytpdb1iO8mbkx1xInnmRQ357lGRQDaZZ
         G2Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759991503; x=1760596303;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZphDIVd5tmeP6KAhy58kJYA1PrGr3bDOHMWlYgqBwIY=;
        b=HBLwNgPOFu3RdP995NnvmCzxY0naFWqM/6yQ1rohhQe4Yjl68XrJcnH74rE+3Yy3jx
         e8IfWzAK2lMYNvdhgwg5GcmZZL1gNrDPHnYTCEfraMWRmTmhLFvI2hr+6299NG5gLzdt
         97vupnd1gbDqxOoR/ckVANwvhyDwutHBUEZTDTHauL6W3usNWpzjYjOBEXqd4ytrysmQ
         8LeOzE6TS98eFb4HUgmVecuEUnB2f/EqScHjbgVIDbl7G7RT85Sz/ZOastMiKdCgQEl9
         7o3/ndEdv8he5AplzLphasM+v4ZDPk+tyix14gtYabnBKMWltB0FPE/cxlXTXp5nq2J7
         KXbw==
X-Forwarded-Encrypted: i=1; AJvYcCUgzLZJMdwjzL0u9+fuoCQSKLCYpXgc6K4sdY1t/ORrF1obDomI29od/XoDBhrG7xjUMjV6qCvbwU8=@lists.infradead.org
X-Gm-Message-State: AOJu0YxyPKQbf32twOBakOWNkw/PrFF2jhwTOjCkjbCo7cDQUfihfb1l
	6E2NKHYJSH5/kuiFQ7y4/QISXKXqGer0gRB2EU4LIqSDa79gYtt0W7AzrsfXyKtQis8=
X-Gm-Gg: ASbGncv1AokDgzKc+f7JwwSLqjLntG0PdGi78GM+NNLNolxv3qEbYARxH1Db8MjzmF4
	efnenBg2uhCiqBNbDrKmDM5YEas1HR7YHompvg5bs1TmiVPcxMQUjhY/R6mho6z887BhkPZ+biQ
	Gu9ZxnWR1+e/dCykasb04mIGZz5dupPi0eS1eyGZbUPen4HcWAJDYu5veVvhtL44LhwOyYDConC
	kF5vTX8m+rD6hol9pu23+16bSwo/C64VG/8nbMWaKRX3g4tt6JAiNzqfCh8wKDZxw0ixEOaxnpk
	K1Klir11NQrQzR46fQb8beQ+bDWg3sAihO+ZOUMb15S8lUWZpC6u1iW8sBEbVVkPCwg5MEjAZUD
	ttVdNApanL7EDEGygzKFK0/P0FbriPzT1td5VH5DD3h8yRiexfd9IEtVAu38=
X-Google-Smtp-Source: AGHT+IEIf07lX5X1t9lPoRt1uKJDa5WT2TozooFfyQvTgQYIm3IKeoNZOzn9APYtFiu6W4PehuHHyQ==
X-Received: by 2002:a05:600c:548b:b0:46e:3d3d:ea92 with SMTP id 5b1f17b1804b1-46fa9b06cabmr25204355e9.5.1759991502804;
        Wed, 08 Oct 2025 23:31:42 -0700 (PDT)
Received: from localhost ([193.86.240.59])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4255d8abf38sm32664903f8f.20.2025.10.08.23.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 23:31:42 -0700 (PDT)
Mime-Version: 1.0
Date: Thu, 09 Oct 2025 08:31:41 +0200
Message-Id: <DDDKX1VNCCVS.2KVYNU4WBEOVI@ventanamicro.com>
Subject: Re: [PATCH] RISC-V: KVM: flush VS-stage TLB after VCPU migration to
 prevent stale entries
Cc: <anup@brainfault.org>, <atish.patra@linux.dev>, <pjw@kernel.org>,
 <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
 <liujingqi@lanxincomputing.com>, <kvm@vger.kernel.org>,
 <kvm-riscv@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <tim609@andestech.com>, "Hui Min Mina Chou"
 <minachou@andestech.com>, "linux-riscv"
 <linux-riscv-bounces@lists.infradead.org>
To: "Ben Zong-You Xie" <ben717@andestech.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20251002033402.610651-1-ben717@andestech.com>
In-Reply-To: <20251002033402.610651-1-ben717@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_233145_498722_CEC668C8 
X-CRM114-Status: GOOD (  15.97  )
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

MjAyNS0xMC0wMlQxMTozNDowMiswODowMCwgQmVuIFpvbmctWW91IFhpZSA8YmVuNzE3QGFuZGVz
dGVjaC5jb20+Ogo+IEZyb206IEh1aSBNaW4gTWluYSBDaG91IDxtaW5hY2hvdUBhbmRlc3RlY2gu
Y29tPgo+Cj4gSWYgbXVsdGlwbGUgVkNQVXMgb2YgdGhlIHNhbWUgR3Vlc3QvVk0gcnVuIG9uIHRo
ZSBzYW1lIEhvc3QgQ1BVLAo+IGhmZW5jZS52dm1hIG9ubHkgZmx1c2hlcyB0aGF0IEhvc3QgQ1BV
4oCZcyBWUy1zdGFnZSBUTEIuIE90aGVyIEhvc3QgQ1BVcwo+IG1heSByZXRhaW4gc3RhbGUgVlMt
c3RhZ2UgZW50cmllcy4gV2hlbiBhIFZDUFUgbGF0ZXIgbWlncmF0ZXMgdG8gYQo+IGRpZmZlcmVu
dCBIb3N0IENQVSwgaXQgY2FuIGhpdCB0aGVzZSBzdGFsZSBHVkEgdG8gR1BBIG1hcHBpbmdzLCBj
YXVzaW5nCj4gdW5leHBlY3RlZCBmYXVsdHMgaW4gdGhlIEd1ZXN0LgoKVGhlIGlzc3VlIGNhbiBh
bHNvIGJlIGhpdCB3aXRoIGEgc2luZ2xlIFZDUFUgbWlncmF0ZWQgb3ZlciB0d28gaGFydHM6Cgog
IDEpIFtoYXJ0IEFdIGFjY2Vzc2luZyBYIGFzIFksIGNhY2hpbmcgWC0+WSBpbiBmaXJzdCBzdGFn
ZSBUTEIKICAyKSBbaGFydCBCXSByZW1hcHBpbmcgWCB0byBaLCBzZmVuY2Uudm1hCiAgMykgW2hh
cnQgQV0gYWNjZXNzaW5nIFggYXMgWSwgaW5zdGVhZCBvZiBjb3JyZWN0IFoKCk1pZ3JhdGlvbiBm
cm9tIDIgdG8gMSBkb2VzIGhmZW5jZS5ndm1hLCBidXQgdGhhdCBkb2Vzbid0IGZsdXNoIGZpcnN0
CnN0YWdlIFRMQiwgc28gdGhlIHRyYW5zbGF0aW9uIHByb2R1Y2VzIGFuIGVycm9yIGR1ZSB0byBz
dGFsZSBlbnRyaWVzLgoKV2hhdCBSSVNDLVYgaW1wbGVtZW50YXRpb24gYXJlIHlvdSB1c2luZz8g
IChBbmQgZG9lcyB0aGUgaW1wbGVtZW50YXRpb24KaGF2ZSB0aGUgc2FtZSBtZW1vcnkgYWNjZXNz
IHBlcmZvcm1hbmNlIGluIFY9MCBhbmQgVj0xIG1vZGVzLCBldmVuCnRob3VnaCB0aGUgbGF0dGVy
IGhhcyB0d28gbGV2ZWxzIG9mIFRMQnM/KQoKPiBUbyBmaXggdGhpcywga3ZtX3Jpc2N2X2dzdGFn
ZV92bWlkX3Nhbml0aXplKCkgaXMgZXh0ZW5kZWQgdG8gZmx1c2ggYm90aAo+IEctc3RhZ2UgYW5k
IFZTLXN0YWdlIFRMQnMgd2hlbmV2ZXIgYSBWQ1BVIG1pZ3JhdGVzIHRvIGEgZGlmZmVyZW50IEhv
c3QgQ1BVLgo+IFRoaXMgZW5zdXJlcyB0aGF0IG5vIHN0YWxlIFZTLXN0YWdlIG1hcHBpbmdzIHJl
bWFpbiBhZnRlciBWQ1BVIG1pZ3JhdGlvbi4KPgo+IEZpeGVzOiBiNzliZjIwMjVkYmMgKCJSSVND
LVY6IEtWTTogUmVuYW1lIGFuZCBtb3ZlIGt2bV9yaXNjdl9sb2NhbF90bGJfc2FuaXRpemUoKSIp
CgpiNzliZjIwMjVkYmMgZG9lcyBub3QgY2hhbmdlIGJlaGF2aW9yLgpUaGUgYnVnIG11c3QgaGF2
ZSBiZWVuIGludHJvZHVjZWQgZWFybGllci4KCj4gU2lnbmVkLW9mZi1ieTogSHVpIE1pbiBNaW5h
IENob3UgPG1pbmFjaG91QGFuZGVzdGVjaC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogQmVuIFpvbmct
WW91IFhpZSA8YmVuNzE3QGFuZGVzdGVjaC5jb20+Cj4gLS0tCj4gZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3Yva3ZtL3ZtaWQuYyBiL2FyY2gvcmlzY3Yva3ZtL3ZtaWQuYwo+IEBAIC0xNDYsNCArMTQ2
LDEwIEBAIHZvaWQga3ZtX3Jpc2N2X2dzdGFnZV92bWlkX3Nhbml0aXplKHN0cnVjdCBrdm1fdmNw
dSAqdmNwdSkKClRoZSBmdW5jdGlvbiBpcyBub3cgZG9pbmcgbW9yZSB0aGF0IHNhbml0aXppbmcg
Z3N0YWdlLgpNYXliZSB3ZSBjYW4gYWdhaW4gY2FsbCBpdCBrdm1fcmlzY3ZfbG9jYWxfdGxiX3Nh
bml0aXplKCk/Cgo+ICAKPiAgCXZtaWQgPSBSRUFEX09OQ0UodmNwdS0+a3ZtLT5hcmNoLnZtaWQu
dm1pZCk7Cj4gIAlrdm1fcmlzY3ZfbG9jYWxfaGZlbmNlX2d2bWFfdm1pZF9hbGwodm1pZCk7Cj4g
Kwo+ICsJLyoKPiArCSAqIEZsdXNoIFZTLXN0YWdlIFRMQnMgZW50cnkgYWZ0ZXIgVkNQVSBtaWdy
YXRpb24gdG8gYXZvaWQgdXNpbmcKPiArCSAqIHN0YWxlIGVudHJpZXMuCj4gKwkgKi8KPiArCWt2
bV9yaXNjdl9sb2NhbF9oZmVuY2VfdnZtYV9hbGwodm1pZCk7Cj4gIH0KCkkgaGFkIHNvbWUgbml0
cywgYnV0IHRoZSBhcHByb2FjaCBpcyBzb3VuZCwKClJldmlld2VkLWJ5OiBSYWRpbSBLcsSNbcOh
xZkgPHJrcmNtYXJAdmVudGFuYW1pY3JvLmNvbT4KClRoYW5rcy4KCi0tLQpUaGVyZSBpcyBhIHJv
b20gZm9yIGEgUklTQy1WIGV4dGVuc2lvbiB0aGF0IHRlbGxzIHdoZXRoZXIgdGhlIHR3byBUTEIK
Zmx1c2hlcyBhcmUgbmVlZGVkLCBvciBoZmVuY2UuZ3ZtYSBpcyBlbm91Z2guIDopCgotLSAKa3Zt
LXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
