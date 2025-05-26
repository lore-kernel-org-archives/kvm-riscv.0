Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B52A4C5AD49
	for <kvm-riscv@archiver.kernel.org>; Mon, 26 May 2025 09:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wCk2lMOrRyoUaKpMM0CI2UW3RCbYjUPs3jglts+gkQw=; b=vTfsOCAwVw9HIH
	0mj1PgmWqxiLk01SZ8LTA9HrnUDB4LrV3F/DPZbIOsQRu7uo+Ryu8kNFuusa193/5M81fT4rBpjyw
	acAc0zMMl9ZqF7qx5i8hveWSCxxt9MnYT76QCxWIYVGnr83BevNbkwcbWvZbHAL4JXozJPCV39fox
	aQ2iaWjIkWmCKdj1wB6hb/gjwbqhed0iUuaG9wDH6Hjx5fAlXDLLlIsj+F7pI1lAQAoI+g1sTI1zD
	Z723DkK26xP3A/CoDD+ScIux6ibxP1vi7zhM0JFw+3lQpddSk26kwWjvssGD/WAZYehmSeOWunWGC
	Ps0upAqskYjuNjWwg2dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJThF-00000008S2u-256e;
	Mon, 26 May 2025 09:00:37 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJThB-00000008S10-1Qpp
	for kvm-riscv@lists.infradead.org;
	Mon, 26 May 2025 09:00:35 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-442ea0b3b46so3232195e9.0
        for <kvm-riscv@lists.infradead.org>; Mon, 26 May 2025 02:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1748250032; x=1748854832; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Px13KBn3Ab4PML/y+5ws+0a8JDTrznN8pyXvkr61Wiw=;
        b=l7aqCa9VgZzoypNzoLJjFXcK7IcQOxdO/AFsskuOjS6oBIft+C7ORlWAaj0qFzb2C+
         OsgAEHGpF4jwb9aRQ1/EDH6Owm+xV7oi6laVkaPs/Fm7+abTziHARSEdVjcxT/H6tRiC
         H+6AfgmgOWjTbgR+dC96MgFOoTEYcLN4njDQ+NaZoGCITXfDs2h1mSVPjdaDBkpcM0y/
         E3KryETHgzZjiEKULVe7cRUCK/XOwjepNFNvNxYLkkUqFlZ5wzI8AGge/xdpkTuJtVPp
         uIV2rb2yS4O8gRJKK361Md3a7nnQbEf3GNFPfev+o4Wco0uCPXMydQofj3sen7XMQqWV
         SMgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748250032; x=1748854832;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Px13KBn3Ab4PML/y+5ws+0a8JDTrznN8pyXvkr61Wiw=;
        b=I7Mv1uQDR6Bh78aBaUjG3BC1nTm9shTlkThNPwTStep+99JD1nTbLi7iaHS/TPpV+T
         ZKTnfbPhBHTtj1cxHMsAH4k79uPBovE13ThGka3GNkn5lWZjU3PKlstJhP2my4diV3EC
         h3Ie5uOcK+AgOzje8yGL8CrpgTfA9GgMe5oqKfdh5gG1O1T2RGnxsQ7rQQmOZByyt6GZ
         mZXugdb8aNaQ+LidHzm22VvWs71LUGJsx9UEV6o2+zt0NW1KEevWgzS7gkiqtv+7DyhF
         xwqs1hgFBq7pJWJ1972Py6IpbCX9uPNvuvHM+noJQryqY2WQGoSTWP+PRbKgPgIduocd
         K/BA==
X-Forwarded-Encrypted: i=1; AJvYcCX6sSBMT4Ux1RhfXg+aHxlC6UNpzIWYcRZXja2HQMZ6IrlotgCBglrMxxD5+kaT9vZXrBEdnxoBI9A=@lists.infradead.org
X-Gm-Message-State: AOJu0YwSerk/1v7BRO5cAy5zZsuMxLf1ITMw72yBoWXkVBPNRspFEPbI
	DvWEFGXKJWW0ODYxcXe77Gb+cmxpmtjk6LeMIwc3R9rDKiOEo75jd6zMEh2rx1CP/I0tgfjLTUj
	aQ/FX
X-Gm-Gg: ASbGncvIucJZVeDu/Gobf3GiWEFxwor52GUiWcJHpCo3JuewP0FUZgd6nymtrvakOwR
	wCQlxSRxo1SDP0NuXfqqvf/rE9mBc45HXzLa8qb/ZPW1O0MThKnUIKTexkEoRPWugJe3hdqd3Pn
	gmSkdWPdjmXebNkrXiRvTM4sGki2ByS3bqJIMhSO6vQMgK1aRHAhvS+QFx8tHXEWqKKiT/NS4ls
	DTNteOQBpdsUIuLlxAgAfH8c3q5fArcKOOv7/aSB3iarlaGLGMt0pgQqLrQD4IPkUp4z36fOhp3
	5BmEsxiC7LfewdG/4zURFLT+nipvzhEgRRvusHPbl+jbtkiVOC/2VEi9150=
X-Google-Smtp-Source: AGHT+IF/tn9b6UQhPJeT+xCpvDd/FmqeY7qs1H9ffakgmE7eWhdvKQVPuHh5QupMD48NcHbdDQ76XQ==
X-Received: by 2002:a05:600c:1547:b0:439:9909:c785 with SMTP id 5b1f17b1804b1-44c935dd918mr24933285e9.7.1748250031502;
        Mon, 26 May 2025 02:00:31 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:b85a:a7d4:fa4e:bb11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f3dd94f1sm235682295e9.35.2025.05.26.02.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 02:00:31 -0700 (PDT)
Mime-Version: 1.0
Date: Mon, 26 May 2025 11:00:30 +0200
Message-Id: <DA5YWWPPVCQW.22VHONAQHOCHE@ventanamicro.com>
Subject: Re: [PATCH v3 9/9] RISC-V: KVM: Upgrade the supported SBI version
 to 3.0
Cc: <linux-riscv@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "Palmer Dabbelt" <palmer@rivosinc.com>, <kvm@vger.kernel.org>,
 <kvm-riscv@lists.infradead.org>, "linux-riscv"
 <linux-riscv-bounces@lists.infradead.org>
To: "Atish Patra" <atish.patra@linux.dev>, "Anup Patel"
 <anup@brainfault.org>, "Will Deacon" <will@kernel.org>, "Mark Rutland"
 <mark.rutland@arm.com>, "Paul Walmsley" <paul.walmsley@sifive.com>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, "Mayuresh Chitale"
 <mchitale@ventanamicro.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250522-pmu_event_info-v3-0-f7bba7fd9cfe@rivosinc.com>
 <20250522-pmu_event_info-v3-9-f7bba7fd9cfe@rivosinc.com>
 <DA3KSSN3MJW5.2CM40VEWBWDHQ@ventanamicro.com>
 <61627296-6f94-45ea-9410-ed0ea2251870@linux.dev>
In-Reply-To: <61627296-6f94-45ea-9410-ed0ea2251870@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_020033_378305_AEBED2BD 
X-CRM114-Status: GOOD (  10.11  )
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

MjAyNS0wNS0yM1QxMDoxNjoxMS0wNzowMCwgQXRpc2ggUGF0cmEgPGF0aXNoLnBhdHJhQGxpbnV4
LmRldj46Cj4gT24gNS8yMy8yNSA2OjMxIEFNLCBSYWRpbSBLcsSNbcOhxZkgd3JvdGU6Cj4+IDIw
MjUtMDUtMjJUMTI6MDM6NDMtMDc6MDAsIEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2b3NpbmMuY29t
PjoKPj4+IFVwZ3JhZGUgdGhlIFNCSSB2ZXJzaW9uIHRvIHYzLjAgc28gdGhhdCBjb3JyZXNwb25k
aW5nIGZlYXR1cmVzCj4+PiBjYW4gYmUgZW5hYmxlZCBpbiB0aGUgZ3Vlc3QuCj4+Pgo+Pj4gU2ln
bmVkLW9mZi1ieTogQXRpc2ggUGF0cmEgPGF0aXNocEByaXZvc2luYy5jb20+Cj4+PiAtLS0KPj4+
IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92Y3B1X3NiaS5oIGIvYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fdmNwdV9zYmkuaAo+Pj4gLSNkZWZpbmUgS1ZNX1NCSV9W
RVJTSU9OX01BSk9SIDIKPj4+ICsjZGVmaW5lIEtWTV9TQklfVkVSU0lPTl9NQUpPUiAzCj4+IEkg
dGhpbmsgaXQncyB0aW1lIHRvIGFkZCB2ZXJzaW9uaW5nIHRvIEtWTSBTQkkgaW1wbGVtZW50YXRp
b24uCj4+IFVzZXJzcGFjZSBzaG91bGQgYmUgYWJsZSB0byBzZWxlY3QgdGhlIGRlc2lyZWQgU0JJ
IHZlcnNpb24gYW5kIEtWTSB3b3VsZAo+PiB0ZWxsIHRoZSBndWVzdCB0aGF0IG5ld2VyIGZlYXR1
cmVzIGFyZSBub3Qgc3VwcG9ydGVkLgo+Cj4gV2UgY2FuIGFjaGlldmUgdGhhdCB0aHJvdWdoIG9u
ZXJlZyBpbnRlcmZhY2UgYnkgZGlzYWJsaW5nIGluZGl2aWR1YWwgU0JJIAo+IGV4dGVuc2lvbnMu
Cj4gV2UgY2FuIGV4dGVuZCB0aGUgZXhpc3Rpbmcgb25lcmVnIGludGVyZmFjZSB0byBkaXNhYmxl
IGEgc3BlY2lmaWMgU0JJIAo+IHZlcnNpb24gZGlyZWN0bHkKPiBpbnN0ZWFkIG9mIGluZGl2aWR1
YWwgb25lcyB0byBzYXZlIHRob3NlIElPQ1RMIGFzIHdlbGwuCgpZZXMsIEkgYW0gYWxsIGluIGZh
dm9yIG9mIGxldHRpbmcgdXNlcnNwYWNlIHByb3ZpZGUgYWxsIHZhbHVlcyBpbiB0aGUKQkFTRSBl
eHRlbnNpb24uCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2
bS1yaXNjdgo=
