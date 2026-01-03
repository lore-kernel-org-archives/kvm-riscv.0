Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6198FC6175
	for <kvm-riscv@archiver.kernel.org>; Sat,  3 Jan 2026 15:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Uuh8ttuZw0UiqL0FItwPuFc8CN2m/bk0PgLEMg1QRMA=; b=bmnzzYP954EX6Y
	RBQzz3eNUH72Tp8i9IbvtlnXIlXu2PZS9DVlaThgpme4CZQDC/k7pza7OWkJyIGxVZNJwBEDSl288
	+X3lG+URvfKpFTSUCgMZxTRwrBfmQsgbUwAY9XWcJ+0mCGJvCoPiZyFXKYoGoxUQ5Wl53dGWqicAe
	ejX//PJ5pw/UAJwPA8CcqJFOh50Lj8LEqNqRXsNO8nripg82W/tvFjut4ppRPXCJbvHiTyAAf9HHE
	YCePhJgmOGbxxQ5cCiACJAM8zUBQAiecFq99jhOli38WurUYPQCWJgqmGQONkNWxKZve3DPHPdQbK
	DWLccX4J3vxG6Ynsn9EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vc3AK-00000009QG8-34gr;
	Sat, 03 Jan 2026 15:03:40 +0000
Received: from mail-ua1-x936.google.com ([2607:f8b0:4864:20::936])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vc3AF-00000009QFN-1QEE
	for kvm-riscv@lists.infradead.org;
	Sat, 03 Jan 2026 15:03:36 +0000
Received: by mail-ua1-x936.google.com with SMTP id a1e0cc1a2514c-9412f43cb9eso7284624241.2
        for <kvm-riscv@lists.infradead.org>; Sat, 03 Jan 2026 07:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767452614; x=1768057414; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mwrVIBUzkZVqv+2p7KMwhr9VJcQGMPPRO78K+5XEw1A=;
        b=dF/94+tERDIV882O+/3Do5Rycxp5S1d8fqAzYZFmof/GVvH/k4JmYeQv8/ILD3Hn8+
         wObWYS0WpSM+gTQ/OFipSdkrgiBW+HnWXZusvWxs07vymfJY9pX6Uu5Xj7WjMEJVx8dQ
         IxnEK/dr5EaSqhA/yhiSSI+jdB2Y3dNjOQpp5eg5EK1bK4ixJa9xofbn2+hcrwTYzer3
         qBXEdb2vBt9w1CgWsOpVFie6I4aQsBJp10xrdxVOuHkQM1Ev3d+cJ3NQc/TbK76iHdut
         Cuqry8i3XYFQ08xELr1B4OB18UaXqM440mtI7NK/yRBF1kdmcCw7NsduihfeBCmCWiQO
         MT6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767452614; x=1768057414;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mwrVIBUzkZVqv+2p7KMwhr9VJcQGMPPRO78K+5XEw1A=;
        b=IySEzfaoWUaJayaMJXTFJ14eK0cPbfFIKVRUkkD7CufKdUQr+Za8WLUOyZFMymGfGv
         zugm3OmUfBVgfFTxs9h2jHOh3l4mr1lQVZJQXPd4xUMRmomM+5+Jhje+vG2P6rBlblhd
         o2EMGY35bkT/1mwtVYlSTkTbbYrm5WOc1PHsju5EO9pua8I9F+C5NNPFdCYNG1aA5ZGh
         hETHDcxVozZn3OvMVBc+TvitGjLjyfg9FkjlSNKHAUZ+6zjQSdwc1Z3zxbMBz6BJG0b+
         3R21PK8sz1hSOnqrGpTTCS1gK0DOawU5Tu+Go7kUWidtM9e0RXLUaaEMEmWF0ehfIFPE
         tffA==
X-Forwarded-Encrypted: i=1; AJvYcCU2TNPq7RG1xDh4uwBttMWrv8NhhJMR68m8aX/1wgSZmnGl0n6+2ixOppaoiaDvh0W58u2gudyK27c=@lists.infradead.org
X-Gm-Message-State: AOJu0YyOfZ5n51IUpwlHuNJDhDzMwUyiAzhbuw4hcL4q4VlM2ua95b80
	rMfGz3R97exxYZ+p5IAI8272JEvs5OZ2HP6vI2H5U1KJtfhmCfXNGQgMslY7kqjAxDbmmCx7k9K
	9oPQJWmAPget3Zx1LJ8bgzcE8c+98o+k=
X-Gm-Gg: AY/fxX7I8yRlMvoWDiaXy/NM+QbtUB0W1V/Z1VN2fx6vS2sVMtSMYxxTgSBh4Y9XqAz
	M+3nXBVguMSPbW9dPnSPQyIFVhL7wcLlGGe+SuXMIrhf8LRtDt119Wpv5O8ZwQ7DZWYC+5c/uk+
	6IiTIc+Dj3uEBI/90lBknTo4wMhZZLmBjcbz54iiK2ImgfJBop6UvzoJCKVxZ4lIi+1quUiMC91
	i1V0BUnhQsVURq781Sh+8YECxMHaf9KrVoNqpXZBLZN7i4Lvittie28SlbuKx51bs+2S8274egv
	M1/qtWaB0ZDpXWWDUKNVqtV80U8nFQAhAysPAyBs
X-Google-Smtp-Source: AGHT+IEe0TGbcVDQqYkKLDV2fz4CdCsKkxINqQGJz/SsAWdLoWUyDnC12Cf+IziDzjbrjZgNHmrLfFHz+90HMxyIiJs=
X-Received: by 2002:a05:6102:c47:b0:5df:aff3:c433 with SMTP id
 ada2fe7eead31-5eb1a699b01mr15138065137.16.1767452613476; Sat, 03 Jan 2026
 07:03:33 -0800 (PST)
MIME-Version: 1.0
References: <20260103094501.5625-1-naohiko.shimizu@gmail.com>
 <20260103094501.5625-2-naohiko.shimizu@gmail.com> <CAK9=C2XTi9Gjy0oJExGyaVvPbh2+cJzmeea5JnMR4d3kbvDJDA@mail.gmail.com>
In-Reply-To: <CAK9=C2XTi9Gjy0oJExGyaVvPbh2+cJzmeea5JnMR4d3kbvDJDA@mail.gmail.com>
From: Naohiko Shimizu <naohiko.shimizu@gmail.com>
Date: Sun, 4 Jan 2026 00:03:24 +0900
X-Gm-Features: AQt7F2qE5-G8e1VDYm3BBWvysOBQQbD6CjAauhjy-Wp1nfvQllESnaQ8TjIZqrU
Message-ID: <CAA7_YY-t2wWaqztey6Y3+eS8R=uvQnY6kT2h+vMzFAiZkGh4og@mail.gmail.com>
Subject: Re: [PATCH 1/3] riscv: clocksource: Fix stimecmp update hazard on RV32
To: Anup Patel <apatel@ventanamicro.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	anup@brainfault.org, atish.patra@linux.dev, daniel.lezcano@linaro.org, 
	tglx@linutronix.de, nick.hu@sifive.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260103_070335_377252_F87AC4F1 
X-CRM114-Status: GOOD (  17.34  )
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

SGkgQW51cCwKClRoYW5rIHlvdSBmb3IgeW91ciByZXZpZXcuCgpJIGFncmVlLiBJIHdpbGwgdXBk
YXRlIHRoZSBjb21taXQgZGVzY3JpcHRpb24gaW4gdjIgdG8gZXhwbGljaXRseSBjaXRlCnRoZSBS
SVNDLVYgUHJpdmlsZWdlZCBTcGVjaWZpY2F0aW9uIGFuZCBleHBsYWluIHdoeSB0aGUgMy1zdGVw
CnByb2dyYW1taW5nIHNlcXVlbmNlIGlzIG5lY2Vzc2FyeSB0byBhdm9pZCB0aW1lciBoYXphcmRz
IG9uIFJWMzIuCgpCcmllZmx5LCB0aGUgY3VycmVudCBjb2RlIHdyaXRlcyB0aGUgTFNCIGZpcnN0
IHdpdGhvdXQgZW5zdXJpbmcgaXQncwppbiB0aGUgZnV0dXJlLCB3aGljaCBjYW4gdHJpZ2dlciBh
IHNwdXJpb3VzIGludGVycnVwdCBpZiBUaW1lID49CntzdGltZWNtcGgob2xkKSwgc3RpbWVjbXAo
bmV3KX0gYmVjb21lcyB0cnVlIG1vbWVudGFyaWx5LiBUaGUgbmV3CnNlcXVlbmNlIGZvbGxvd3Mg
dGhlIHNwZWMncyByZWNvbW1lbmRhdGlvbiBmb3IgbXRpbWVjbXAgKFNlY3Rpb24KMy4yLjEpIHRv
IGVuc3VyZSB0aGUgNjQtYml0IHZhbHVlIGlzIGFsd2F5cyAiaW4gdGhlIGZ1dHVyZSIgZHVyaW5n
IHRoZQp1cGRhdGUuCgpJIHdpbGwgYXBwbHkgdGhlIHNhbWUgZGV0YWlsZWQgZGVzY3JpcHRpb24g
dG8gW1BBVENIIDIvM10gYXMgd2VsbC4KClJlZ2FyZHMsIE5hb2hpa28gU2hpbWl6dQoKCk9uIFNh
dCwgSmFuIDMsIDIwMjYgYXQgMTE6NDbigK9QTSBBbnVwIFBhdGVsIDxhcGF0ZWxAdmVudGFuYW1p
Y3JvLmNvbT4gd3JvdGU6Cj4KPiBPbiBTYXQsIEphbiAzLCAyMDI2IGF0IDM6MTbigK9QTSBOYW9o
aWtvIFNoaW1penUKPiA8bmFvaGlrby5zaGltaXp1QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBQbGVh
c2UgYWRkIGEgZGV0YWlsZWQgY29tbWl0IGRlc2NyaXB0aW9uIGFib3V0IHdoeSB0aGUKPiBuZXcg
d2F5IG9mIHByb2dyYW1taW5nIHN0aW1lY21wIGlzIGJldHRlci4gQWxzbywgZXhwbGFpbgo+IHdo
YXQgdGhlIGN1cnJlbnQgUHJpdiBzcGVjIHNheXMgaW4gdGhpcyBjb250ZXh0Lgo+Cj4gPgo+ID4g
U2lnbmVkLW9mZi1ieTogTmFvaGlrbyBTaGltaXp1IDxuYW9oaWtvLnNoaW1penVAZ21haWwuY29t
Pgo+ID4gLS0tCj4gPiAgZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci1yaXNjdi5jIHwgMyArKy0K
PiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPgo+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xvY2tzb3VyY2UvdGltZXItcmlzY3YuYyBiL2RyaXZl
cnMvY2xvY2tzb3VyY2UvdGltZXItcmlzY3YuYwo+ID4gaW5kZXggNGQ3Y2YzMzg4MjRhLi5jZmM0
ZDgzYzQyYzAgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2Nsb2Nrc291cmNlL3RpbWVyLXJpc2N2
LmMKPiA+ICsrKyBiL2RyaXZlcnMvY2xvY2tzb3VyY2UvdGltZXItcmlzY3YuYwo+ID4gQEAgLTUw
LDggKzUwLDkgQEAgc3RhdGljIGludCByaXNjdl9jbG9ja19uZXh0X2V2ZW50KHVuc2lnbmVkIGxv
bmcgZGVsdGEsCj4gPgo+ID4gICAgICAgICBpZiAoc3RhdGljX2JyYW5jaF9saWtlbHkoJnJpc2N2
X3NzdGNfYXZhaWxhYmxlKSkgewo+ID4gICNpZiBkZWZpbmVkKENPTkZJR18zMkJJVCkKPiA+IC0g
ICAgICAgICAgICAgICBjc3Jfd3JpdGUoQ1NSX1NUSU1FQ01QLCBuZXh0X3R2YWwgJiAweEZGRkZG
RkZGKTsKPiA+ICsgICAgICAgICAgICAgICBjc3Jfd3JpdGUoQ1NSX1NUSU1FQ01QLCBVTE9OR19N
QVgpOwo+ID4gICAgICAgICAgICAgICAgIGNzcl93cml0ZShDU1JfU1RJTUVDTVBILCBuZXh0X3R2
YWwgPj4gMzIpOwo+ID4gKyAgICAgICAgICAgICAgIGNzcl93cml0ZShDU1JfU1RJTUVDTVAsIG5l
eHRfdHZhbCAmIDB4RkZGRkZGRkYpOwo+ID4gICNlbHNlCj4gPiAgICAgICAgICAgICAgICAgY3Ny
X3dyaXRlKENTUl9TVElNRUNNUCwgbmV4dF90dmFsKTsKPiA+ICAjZW5kaWYKPiA+IC0tCj4gPiAy
LjM5LjUKPiA+Cj4gPgo+Cj4gUmVnYXJkcywKPiBBbnVwCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcg
bGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
