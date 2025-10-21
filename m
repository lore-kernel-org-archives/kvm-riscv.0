Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C461CCD1A5
	for <kvm-riscv@archiver.kernel.org>; Tue, 21 Oct 2025 23:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0catLbhnTIsxghg3+sQkP+pOUg/Shtxn8cCOAfpDsjY=; b=oOu1pOErTEnjmk
	AGXc815CKckxJK/9ODzDCR00mvLGefmayJT3VVqBTznwKUR8ziN+FcF8hvmlCU6kItlov8PxrgXI2
	XAtAaXilhL2UIoF5Z8s9NhLaOZGAZH2tI8xcahpPssSFA0RIPrH7hVu3+/EvDQLXlkWDhEgTzrT6w
	jgH3/a6jdw4a/DRljgKG5BtVcGjjpHuJJ/JMCJ2C/tqgpsrCEvU8KhxFYwtPgXu4U3Z8ifeNsr3u+
	jmT3RWIKcTfiSoLt9Afi7wqsx5nRtvwlSIdHIPEsRLGsRhzByBTCsqllh6e7OzDxDnlB32zbxarpG
	46rqEL22BU0K1Dn5ZMkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBMCj-0000000107u-3MgE;
	Tue, 21 Oct 2025 23:55:50 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBMCh-0000000106z-2SvK
	for kvm-riscv@lists.infradead.org;
	Tue, 21 Oct 2025 23:55:48 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-78af743c232so4892094b3a.1
        for <kvm-riscv@lists.infradead.org>; Tue, 21 Oct 2025 16:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1761090947; x=1761695747; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UjxKFvC2DcUtQTiHGNI+J3XW/mqav6SAde5ZIMHDsLA=;
        b=YWurNMLjgy0MlttqzoOlslRQsHo1eqDVIsCLKP6UKwt/tUMH5V4laxXvl6DJzHNL1z
         UzZIe3NBBIBUlFl/Yj9quA5oKiwlzGDKQFGVJFgqbdOBaRe/aGqpcDEpoceaYZCDkJw+
         c0WEWkPSym3XZlDqH1j8uWGm3d3TrG8plXJSXd21lZZ4ZuiPIkYZc3YYP7MJ9kcXoTMM
         j9EgM67HX8X/uLCvy5eLAJr3JbebbD4DQy4e2hiKgwFX8V06At8ExbkxHhQowvstaAeQ
         MePQ1fF9mNmwFgB4C0ARqVD3bsFOTOueFHI5XThOO1kj0ozkMhOOYD75qxaHSVA86MsG
         md6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761090947; x=1761695747;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UjxKFvC2DcUtQTiHGNI+J3XW/mqav6SAde5ZIMHDsLA=;
        b=Ww1WDOr1c8k3sMkXL9iaaZfsbvaiflNvjP9XcyqsPhuZEMH7vcviohyWALYcoDlc3p
         jtCEd7QNrklqfW4wdc4fZE9pztp/aGmW/U4VawovbjAusjKDRjSFdJwmswIONOGDyz5H
         DNSeZtYOEjYJVIyLJvySx1ahY85Xzn0R/+L5LDyI8iZkw5RFsi51MzdvytFEpAA3XYym
         Kqd2v/PMmHLOB0Z98MyoJfQGUPY6GYGybfBzzFvoSjuourWpvESalBk80p6bIO/gZ83X
         XnZPx35DBqnt5lLtrWRPwX/04q2i6dKweLzTSYjZ7d8Y7z1kru0hqvQg6clo29rKb3hK
         aClA==
X-Forwarded-Encrypted: i=1; AJvYcCVaj8fwb1dcxVAhXVyIw9pw/15VO2cv55faAdeNTM/ZHryh0APuRZAXI/wiZPqY35zSQxgt0Eo9zVM=@lists.infradead.org
X-Gm-Message-State: AOJu0YyLKtrNgw4k5IE/gXx4yeywXQHmtpqK01xSXjudI+Eh9WJCryd2
	6n1XtEZXsxMt2IMz1Tuka/Q5j/F9sZW2sMiReRed8tA8sQo+CMN43mSQ+tEiCax1LMU=
X-Gm-Gg: ASbGncsVD5d+X5UlOX9Z0rzm54FodBEjXmMAe4BaQjEbUhdUAlvqza9gfgVot4xoYpB
	ddEPqzdis31q2awmAZvCtSm5b6wqgQ5upLOtSHJtp5k4QyoxzEVvm6vA8K5BBXmjKQhVT+hLbyi
	+uJAx7SFG2b2p+yz5OhvRO6nrv9BEOZdm7AeQ9lV4Fe+8DCuh49McHKP57TUuXsMUgWBzWG+GHV
	8rYImaddOXpRzRQjZ+A23XX7ZWE0VFmNrxT4aii1LoJ7WCYsA2V7dH/aJYsngvB6GbI3uTxMlHH
	0SB+anEfs1KlEHOlJ9T98LbtWgMLqwPVVCRgY0YMrb7cl9u8YkrnGdglyz7RUvj7dkFr5Y1BfUk
	7cXcqb5bhGYs9HSpyOj1V27ax+x4D4iraYHMJ66hfFNSRCdkSwdAO7R06sMKJx00YloH1BGe7Vf
	31PTYxAbwnPwlw
X-Google-Smtp-Source: AGHT+IH1ojJ2U358r/zFpUowgNGZZwpcw3o/HNbSo4D+1B4ujWwmQm17L6iROMoPx0hchqIm1iAEwg==
X-Received: by 2002:a17:90b:2415:b0:33b:c5f6:40ef with SMTP id 98e67ed59e1d1-33bcf8e7384mr16971644a91.24.1761090946661;
        Tue, 21 Oct 2025 16:55:46 -0700 (PDT)
Received: from localhost ([208.115.86.133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33e223f11f0sm730240a91.13.2025.10.21.16.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 16:55:46 -0700 (PDT)
Date: Tue, 21 Oct 2025 16:55:44 -0700
From: Andrew Jones <ajones@ventanamicro.com>
To: Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: Wu Fei <atwufei@163.com>, wu.fei9@sanechips.com.cn, 
	kvm-riscv@lists.infradead.org, kvm-riscv <kvm-riscv-bounces@lists.infradead.org>
Subject: Re: [PATCH 2/2] KVM: riscv: selftests: Detect supported vm modes
Message-ID: <20251021-a97dc10e19bd8542675484dd@orel>
References: <20251017110908650RWBl7sDIk6WUGhkvJSH4L@zte.com.cn>
 <202510170319.59H3JmWd056039@mse-fl2.zte.com.cn>
 <20251017-f2c1b717d2364067c64f95a6@orel>
 <93d3af21-5d3d-465c-a9f2-0eaed7475fb3@163.com>
 <DDNEF8ASSO19.2P4OJ3KYPWRIH@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DDNEF8ASSO19.2P4OJ3KYPWRIH@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_165547_627496_76E641B0 
X-CRM114-Status: GOOD (  22.50  )
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

T24gTW9uLCBPY3QgMjAsIDIwMjUgYXQgMDk6MzI6NTdQTSArMDIwMCwgUmFkaW0gS3LEjW3DocWZ
IHdyb3RlOgo+IDIwMjUtMTAtMjBUMjE6MjY6MTgrMDg6MDAsIFd1IEZlaSA8YXR3dWZlaUAxNjMu
Y29tPjoKPiA+IE9uIDEwLzE4LzI1IDAwOjA0LCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4gPj4+IC0g
ICAgICAgICAgICAgICBndWVzdF9tb2RlX2FwcGVuZChWTV9NT0RFX1A1NlY1N180Sywgc3ogPj0g
NTkpOwo+ID4+PiAtICAgICAgICAgICAgICAgZ3Vlc3RfbW9kZV9hcHBlbmQoVk1fTU9ERV9QNTBW
NDhfNEssIHN6ID49IDUwKTsKPiA+Pj4gLSAgICAgICAgICAgICAgIGd1ZXN0X21vZGVfYXBwZW5k
KFZNX01PREVfUDQxVjM5XzRLLCBzeiA+PSA0MSk7Cj4gPj4+ICsgICAgICAgICAgICAgICBndWVz
dF9tb2RlX2FwcGVuZChWTV9NT0RFX1A1NlY1N180Sywgc2F0cF9tb2RlID49IFNBVFBfTU9ERV81
NyAmJiBzeiA+PSA1OSk7Cj4gPj4+ICsgICAgICAgICAgICAgICBndWVzdF9tb2RlX2FwcGVuZChW
TV9NT0RFX1A1MFY0OF80Sywgc2F0cF9tb2RlID49IFNBVFBfTU9ERV80OCAmJiBzeiA+PSA1MCk7
Cj4gPj4+ICsgICAgICAgICAgICAgICBndWVzdF9tb2RlX2FwcGVuZChWTV9NT0RFX1A0MVYzOV80
Sywgc2F0cF9tb2RlID49IFNBVFBfTU9ERV8zOSAmJiBzeiA+PSA0MSk7Cj4gPj4gCj4gPj4gU29t
ZXRoaW5nIGFsb25nIHRoZXNlIGxpbmVzIHdhcyB3aGF0IEkgd2FzIHN1Z2dlc3RpbmcgaW4gdGhl
IGxhc3QgcGF0Y2gsCj4gPj4gYnV0IHdoZXJlIHdlIHNlbGVjdCBmcm9tIG1hbnkgbW9yZSBjb21i
aW5hdGlvbnMgb2YgUCBhbmQgViBmb3IgbW9kZXMuCj4gPj4KPiA+PiBWTV9NT0RFX1A0MVYzOV80
Swo+ID4+IFZNX01PREVfUDQxVjQ4XzRLCj4gPj4gVk1fTU9ERV9QNDFWNTdfNEsKPiA+PiBWTV9N
T0RFX1A1MFY0OF80Swo+ID4+IFZNX01PREVfUDUwVjU3XzRLCj4gPj4gVk1fTU9ERV9QNTlWNTdf
NEsKPiA+Cj4gPiBEbyB3ZSBuZWVkIG1vcmU/IGUuZy4gZm9yIHN2MzksIHRoZXJlIGNvdWxkIGJl
IFA1MFYzOSBhbmQgUDU2VjM5Lgo+IAo+IEJhcmUgaXMgcHJvYmFibHkgdGhlIG1vc3QgaW1wb3J0
YW50IGZpcnN0IHN0YWdlIG1vZGUsIGFzIGl0J3MgdGhlIG9ubHkKPiBvbmUgdGhhdCBtaWdodCBm
dWxseSB0ZXN0IHRoZSB0d28gZXh0cmEgYml0cyBvZiBTdjU3eDQuCgpJbmRlZWQsIGJ1dCBmb3Ig
dGhhdCB3ZSBuZWVkIGEgbW9kZSBuYW1lZCBzb21ldGhpbmcgbGlrZSBWTV9NT0RFX0JBUkU1OS4K
Cj4gCj4gSSB0aGluayBhIHNpbmdsZSBjb21iaW5hdGlvbiBwZXIgIng0IiBtb2RlIG1pZ2h0IGJl
IHN1ZmZpY2llbnQsIHNpbmNlCj4gYWxsIG5vbi1iYXJlIGZpcnN0IHN0YWdlcyBnZW5lcmF0ZSA1
Ni1iaXQgcGh5c2ljYWwgYWRkcmVzc2VzIGFueXdheSwgYnV0Cj4gaXQgbWFrZXMgc2Vuc2UgdG8g
aGF2ZSBhbGwgb2YgdGhlbSBpZiB3ZSdyZSBkb2luZyBtb3JlIHRoYW4gb25lLgoKWWVhaCwgbWln
aHQgYXMgd2VsbC4KCj4gCj4gPj4gCj4gPj4+ICsKPiA+Pj4gKyAgICAgICAgICAgICAgIC8vIHNl
dCB0aGUgZmlyc3QgKG1heGltdW0pIHN1cHBvcnRlZCBtb2RlIGFzIGRlZmF1bHQKPiA+PiAKPiA+
PiBQbGVhc2UsIG5vIEMrKyBjb21tZW50cywgYW5kIGRvbid0IHdlIHdhbnQgYSBWMzkgbW9kZSB0
byBiZSB0aGUgZGVmYXVsdD8KPiA+PiBJbiBmYWN0LCBWTV9NT0RFX1A0MVYzOV80SyBzaG91bGQg
YWx3YXlzIGJlIHN1cHBvcnRlZCwgc28gd2UgY2FuIGp1c3Qgc2V0Cj4gPj4gVk1fTU9ERV9ERUZB
VUxUIHRvIHRoYXQuCj4gPgo+ID4gSXQncyBsaWtlbHkgdGhlIG1heGltdW0gc3VwcG9ydGVkIG1v
ZGUgaXMgdGhlIG1vc3QgY29tbW9uIGNvbmZpZ3VyYXRpb24gCj4gPiBvbiBwcm9kdWN0aW9uPwo+
IAo+IFllcywgS1ZNIGN1cnJlbnRseSBwaWNrcyB0aGUgd2lkZXN0IG1vZGUsIGFsdGhvdWdoIEkg
dGhpbmsgdGhlIG9wdGltYWwKPiBjaG9pY2Ugb2YgaGdhdHAgaXMgdGhlIHNtYWxsZXN0IG9uZSB0
aGF0IGZ1bGx5IGNvdmVycyB0aGUgd2hvbGUgZ3Vlc3QKPiBwaHlzaWNhbCBhZGRyZXNzIHNwYWNl
Lgo+IAo+IChlLmcuIGlmIGFsbCBndWVzdCBtZW1vcnkgaXMgbWFwcGVkIGJlbG93IDIgVGlCLCBL
Vk0gc2hvdWxkIHBpY2sgU3YzOXg0Cj4gIGZvciBpdHMgaGdhdHAsIHJlZ2FyZGxlc3Mgb2Ygd2hh
dCBpcyB0aGUgd2lkZXN0IHN1cHBvcnRlZCBtb2RlLikKClllcywgYW5kIGZvciB0aGUgdGVzdHMs
IEkgdGhpbmsgdGhlIGd1ZXN0IGNvbmZpZyBjYW4ganVzdCBkZWZhdWx0IHRvIHRoZQptaW5pbWFs
LiBUZXN0cyB0aGF0IG5lZWQgcGFydGljdWxhciBtb2RlcyBjYW4gc2VsZWN0IHRoZW0gd2hlbiBz
dXBwb3J0ZWQuCldlIGVuc3VyZSB0ZXN0cyBydW4gdGhlIHNhbWUgY29kZSBvbiBhbGwgaG9zdHMg
dGhpcyB3YXkgd2hlbiB0aGUgbW9kZQpzZWxlY3RlZCBpc24ndCB3aGF0J3MgdW5kZXIgdGVzdC4K
ClRoYW5rcywKZHJldwoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9rdm0tcmlzY3YK
