Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3A64CA0ED1
	for <kvm-riscv@archiver.kernel.org>; Mon, 18 Aug 2025 06:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bNvDhb/OI0Sg4TEj4talJt0EDrSbdCg6xa7VtzEpCHA=; b=MEFv136K+ScTqK
	idyGXTLbyvpIf98h1Ng43wuJ91BPb76AFjaAt5l2Mi3DqSvRJP0nbwTfBAadt4TOJ9qR/H1Pc8t6h
	r421W/pY4jtJ0ukWoeW+Xxs9zL3bEFQg/L11SbSdpoIR1Y2MEQI/CUYeTXcDPfI/LEoGb2zMmbdve
	DDBMiPmcFKueKQYQsY1mP3Pc3PwWCIG9wSMyuBLYoy8voi/++F7R0BktAiFYtCTujSWSOGz9h1TV/
	efCx2Uaz8kuN2tBi0PT5hhleVuFyiga6764Ce9ihGL/itTUxrI+e2ElFWnd48u+SzF4/hbzi1G6ti
	0DIn7NeGeBMiOpxaQKwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1untEf-00000006cic-3dPb;
	Mon, 18 Aug 2025 06:20:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1untCE-00000006cYR-0jAF;
	Mon, 18 Aug 2025 06:18:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=7CsCE98wLVQVhuvehQUGinEr7cEHLAb9kNCYpJ0V+y0=; b=P6rOCL52aCSd29w++9de4Kaq96
	HgNg5hX4Zx1PQ0dnbXIHbslq5EnzfrGNCN6dMSHeEKYAcci8gLpFusgYgjIj86PcUvKnMHvnOJ2Bl
	udNskfjiygmi+HUTyChvMPDPFF8GYqZDA1GvpcXo9U8j/vALO0A5OsTn8DdQgGYTygT7WRzkokJwd
	KbzQe/8Za8+qq8l6H4R5NUujGgm161fDCYUizoENBBTl2LNKZUmshGq37LNkdzHGiN1X0IJ70kF0v
	oMbbdDUtd9ZiT+zAth/78/BgzeqMpQepnTng1B2wp20MZTXIk3qLqfwabpfmzgEzxj/6mDqLjmi+s
	Rf1UGRGA==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1untC9-0000000HH9j-33Qv;
	Mon, 18 Aug 2025 06:18:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1E1235C593C;
	Mon, 18 Aug 2025 06:18:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81E7CC16AAE;
	Mon, 18 Aug 2025 06:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755497889;
	bh=SxRnpB9Bal81XXxAIu3Q8ZpoPbgIPFb2u57i3OfkJn4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=laMUJFQXl2mCTsBR8Aj8KWJCfW9gocrsjiFvWEqQkqQoCFAtT0GXb/LbwyS0+lvd+
	 Dj3Oh7ExjaL5Msh0jTbPparqfDvl/oPOytkYYYwXmcQExM7aguQuBzTSuQk1B0KwVv
	 TUUa+8nwaN8wUacIzkpv1BrvQQPdjTLtmJDSVX6OLjuM9Y7x5nEQRfbdEyOwnlXFan
	 dUgqRX+foCqpMpErfuTtRvwGggtdQ7unEyEUzasS/hytnqWa4HTTZs7RICVmEx8O7S
	 kQqdxMrmpIoXhy92bY7vVrIRORG2FO9GcKmwAOh+aFVVsUek7vuIrzTR8Eb6DOf7uz
	 q4p4mnGEjrSAw==
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3b9d41c1963so1775398f8f.0;
        Sun, 17 Aug 2025 23:18:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWzUh/D+GsQ2jiPEM5xgVAWdmUH1iRIZuOoh6rXDsCj1y5rlSRGJJVwMDJRI84VV0t8T6G26Vq+OqI=@lists.infradead.org, AJvYcCXns9IPjMXvpVAsQOgxgfxqw8UaJMTFYT2QLZo5knQh7G3vl6aP0mmm8Fd17/ZfiibVHgKIwyidJ0UV7T4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8xNRVACLLxGlLNR9uVN43tncuTVSXTwaPyL0Stt2SCPQwvZBJ
	7nOHz0scOpUwpfcD4l6QWluALECRR431ywxmoydHrbbde/6HQcHg8VxILMIDmf9rYF72031ETpp
	KK6iSEACOeVS7/VgBSgSg1D/agdPgN5s=
X-Google-Smtp-Source: AGHT+IGBvHqXTFBiXkW4Wmjw2VtbPEWEJ5aSZd47qOUAUK/NhJrcIBKM4XbpKEJyrLNJfIG5cFebxW0rtn6XVIe7mOQ=
X-Received: by 2002:a05:6000:26c4:b0:3b4:9b82:d42c with SMTP id
 ffacd0b85a97d-3bc68b89d03mr4788942f8f.17.1755497887956; Sun, 17 Aug 2025
 23:18:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250818054207.21532-1-fangyu.yu@linux.alibaba.com>
In-Reply-To: <20250818054207.21532-1-fangyu.yu@linux.alibaba.com>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 18 Aug 2025 14:17:55 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTqPMVTNdHL7PUwobXQr3dwzKPi13ZDpmkVz+3VXHLZVw@mail.gmail.com>
X-Gm-Features: Ac12FXyXjItsm--fBQaoqgkGrtBgmoHkt-wNlAEue7p0M-vAfPTlga2pclf0gMI
Message-ID: <CAJF2gTTqPMVTNdHL7PUwobXQr3dwzKPi13ZDpmkVz+3VXHLZVw@mail.gmail.com>
Subject: Re: [PATCH V2] RISC-V: KVM: Write hgatp register with valid mode bits
To: fangyu.yu@linux.alibaba.com
Cc: anup@brainfault.org, atish.patra@linux.dev, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	guoren@linux.alibaba.com, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_071814_275653_A86DF474 
X-CRM114-Status: GOOD (  18.04  )
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

T24gTW9uLCBBdWcgMTgsIDIwMjUgYXQgMTo0MuKAr1BNIDxmYW5neXUueXVAbGludXguYWxpYmFi
YS5jb20+IHdyb3RlOgo+Cj4gRnJvbTogRmFuZ3l1IFl1IDxmYW5neXUueXVAbGludXguYWxpYmFi
YS5jb20+Cj4KPiBBY2NvcmRpbmcgdG8gdGhlIFJJU0MtViBQcml2aWxlZ2VkIEFyY2hpdGVjdHVy
ZSBTcGVjLCB3aGVuIE1PREU9QmFyZQo+IGlzIHNlbGVjdGVkLHNvZnR3YXJlIG11c3Qgd3JpdGUg
emVybyB0byB0aGUgcmVtYWluaW5nIGZpZWxkcyBvZiBoZ2F0cC4KPgo+IFdlIGhhdmUgZGV0ZWN0
ZWQgdGhlIHZhbGlkIG1vZGUgc3VwcG9ydGVkIGJ5IHRoZSBIVyBiZWZvcmUsIFNvIHVzaW5nIGEK
PiB2YWxpZCBtb2RlIHRvIGRldGVjdCBob3cgbWFueSB2bWlkIGJpdHMgYXJlIHN1cHBvcnRlZC4K
R29vZCBjYXRjaCEgSXQncyBhIGJ1Zy4gVGhlIGNvZGUgc2VlbXMgY29waWVkIGZyb20gYXNpZHNf
aW5pdCgpLCB3aG9zZQpvbGQgdmFsdWUgaXMgbm90IGJhcmUgbW9kZS4gRm9yIHJlYWwgaGFyZHdh
cmUsIGl0IHdvdWxkIGNhdXNlCnByb2JsZW1zLCBidXQgdGhlIHFlbXUgYnVnZ3kgY29kZSBoaWRl
cyB0aGUgcHJvYmxlbS4KCkl0IG5lZWRzIGEgdGFnOiBGaXhlczogZmQ3YmI0YTI1MWRmICgiUklT
Qy1WOiBLVk06IEltcGxlbWVudCBWTUlEIGFsbG9jYXRvciIpCgpPdGhlcnMsIFJldmlld2VkLWJ5
OiBHdW8gUmVuIDxndW9yZW5Aa2VyZW5sLm9yZz4KCj4KPiBTaWduZWQtb2ZmLWJ5OiBGYW5neXUg
WXUgPGZhbmd5dS55dUBsaW51eC5hbGliYWJhLmNvbT4KPgo+IC0tLQo+IENoYW5nZXMgaW4gdjI6
Cj4gLSBGaXhlZCBidWlsZCBlcnJvciBzaW5jZSBrdm1fcmlzY3ZfZ3N0YWdlX21vZGUoKSBoYXMg
YmVlbiBtb2RpZmllZC4KPiAtLS0KPiAgYXJjaC9yaXNjdi9rdm0vdm1pZC5jIHwgMyArKy0KPiAg
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAt
LWdpdCBhL2FyY2gvcmlzY3Yva3ZtL3ZtaWQuYyBiL2FyY2gvcmlzY3Yva3ZtL3ZtaWQuYwo+IGlu
ZGV4IDNiNDI2YzgwMDQ4MC4uNWYzMzYyNWY0MDcwIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yv
a3ZtL3ZtaWQuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZtaWQuYwo+IEBAIC0xNCw2ICsxNCw3
IEBACj4gICNpbmNsdWRlIDxsaW51eC9zbXAuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L2t2bV9ob3N0
Lmg+Cj4gICNpbmNsdWRlIDxhc20vY3NyLmg+Cj4gKyNpbmNsdWRlIDxhc20va3ZtX21tdS5oPgo+
ICAjaW5jbHVkZSA8YXNtL2t2bV90bGIuaD4KPiAgI2luY2x1ZGUgPGFzbS9rdm1fdm1pZC5oPgo+
Cj4gQEAgLTI4LDcgKzI5LDcgQEAgdm9pZCBfX2luaXQga3ZtX3Jpc2N2X2dzdGFnZV92bWlkX2Rl
dGVjdCh2b2lkKQo+Cj4gICAgICAgICAvKiBGaWd1cmUtb3V0IG51bWJlciBvZiBWTUlEIGJpdHMg
aW4gSFcgKi8KPiAgICAgICAgIG9sZCA9IGNzcl9yZWFkKENTUl9IR0FUUCk7Cj4gLSAgICAgICBj
c3Jfd3JpdGUoQ1NSX0hHQVRQLCBvbGQgfCBIR0FUUF9WTUlEKTsKPiArICAgICAgIGNzcl93cml0
ZShDU1JfSEdBVFAsIChrdm1fcmlzY3ZfZ3N0YWdlX21vZGUgPDwgSEdBVFBfTU9ERV9TSElGVCkg
fCBIR0FUUF9WTUlEKTsKPiAgICAgICAgIHZtaWRfYml0cyA9IGNzcl9yZWFkKENTUl9IR0FUUCk7
Cj4gICAgICAgICB2bWlkX2JpdHMgPSAodm1pZF9iaXRzICYgSEdBVFBfVk1JRCkgPj4gSEdBVFBf
Vk1JRF9TSElGVDsKPiAgICAgICAgIHZtaWRfYml0cyA9IGZsc19sb25nKHZtaWRfYml0cyk7Cj4g
LS0KPiAyLjQ5LjAKPgoKCi0tIApCZXN0IFJlZ2FyZHMKIEd1byBSZW4KCi0tIAprdm0tcmlzY3Yg
bWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
