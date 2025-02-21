Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79AFBC021B5
	for <kvm-riscv@archiver.kernel.org>; Fri, 21 Feb 2025 17:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=swTFGh0ngdSZT6/UHNW1fQPnjsvjoPb8rxeKbHn7qyU=; b=sH7IX8nYHDr4HG
	F5EQiuGrXUZaOgtmrJUtesVWgo2H8Y5zWjhXZ0acxgtVWxDvnF4F1W4oTTWelDMMc9ABgYILUuEtC
	99P51AB6QXUaZSnp+2x/h0Gbf0WZWafCX41l8ANgHWupSXuNF93VC8umo8ddeNiM8S5rXU5+KXU2e
	kgHRE526LiLIAXQb1WswOz1h7ETPxtXpQeeRrjBxKJamwbE3bfajf5hZnhGNewvJjxbQX7Fw34XMl
	FRW6V1GtJzBo5yRgHliKsgoI2+P8Q1q0T4inhakjxfBvTxR2jzuNAGCb9Jst22U+UPJkv3RQ8KeN1
	DWXG89E9epujm3vPAiEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlWY1-00000006KDG-0SEG;
	Fri, 21 Feb 2025 17:10:45 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlWU2-00000006J63-3M8p
	for kvm-riscv@lists.infradead.org;
	Fri, 21 Feb 2025 17:06:40 +0000
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-3ce868498d3so6884695ab.3
        for <kvm-riscv@lists.infradead.org>; Fri, 21 Feb 2025 09:06:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1740157597; x=1740762397; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i0/CbgssrY9MdmhvaS9VAi8CgxuGoYSwiPbuLyClY14=;
        b=wsF7iNv2lIL8vrjgnJkYocHAsaaX9YqGre93yMJAWqqIiPmo16/rtzRF5oqPOBF/PC
         ja1bk/4SeyqrtLWnY3mqrZjpLgTJA5Wl3eZKQj0swKoMhF2ZZWzxk/JSBkErCRu/7QIC
         0e+kJ0SfO65LQFOftViul9LTe31MdMRkjodxW/2qigsrC75KIF8BTVdlo5nWWOevgwoC
         Gk7sL11ZDeEvjZRRFTEU/46KIGCPgxZfOyNx16xeyC02O4GbtaxkoS++Es7uIm+oL9GQ
         vkS6r3R7Yu3Aa5kDc3B8NB7mirsQGutCfmaQHuQLE69RCFy+faA7APu8M/HcFBF4NZiV
         JwrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740157597; x=1740762397;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i0/CbgssrY9MdmhvaS9VAi8CgxuGoYSwiPbuLyClY14=;
        b=ZHJ9Ufzaj6o92/b+/KW3+8cvMU/I8wle3EzNyv527AIIR+g6iy0UVWt97GlfWmzbXK
         DeFU4Y3THjgfX8jTEU2FNeIIiJUATipbTDdYicFyQ6v6BFWQmdUGzCL6V/0EmqbIIjXs
         lKx/IKf3ROiHSWgaCGRdgvk4YyBvVmtpO3X2cayLMC1hu+9GNiu8i5G1VhOWEyZOIS7j
         A9zyX7dhhr6iShrP/XGPT3mESvEGxeag4C8W9jRQQI6TDhRE2/E4crIkjZ//B/TcBMQU
         naC9D9bpmUb2OsObXaYVDZ48gVwkuFNubuVz4N0DIN+46Qlep9aj2GlXEAU/kcGg3Ddg
         XklA==
X-Forwarded-Encrypted: i=1; AJvYcCWqyK9FKY6KflGBPScDMopCLAYJgEvvOqO4BK2OboR4g2vrvsm8WCzt/TIN15XUuxSkchE6UXrSsB8=@lists.infradead.org
X-Gm-Message-State: AOJu0YzzjWUdkVKRMMd503GEpMV6zHEobBfCIZ8T7Jeaze1MKISav91O
	KwNOKhKkqyptPykUhRnBw6Y+RkmJ0PMxwGVftCdFu/GLPQihwe12UurndIyZOOgwZjwnP/GTxqe
	4EKBUOxgpKW/vPR0rzZFzHRCAqfBeEOAy+aqFvg==
X-Gm-Gg: ASbGncvJz+xAH9dcatUrJNQuqeoCUmTtCp2NCXqxfFQ0JCMDo709pS67ZSduOB5cWZB
	MW9jHsBAcYk4dkEbCj8vwtkiwjQQDoB+y1UUetV9b+qIfyegHnjLMmz5XwqrpbAcv3/sqWaNzka
	L4KA8NFoHm
X-Google-Smtp-Source: AGHT+IFddscccecyBJuHpMIYpYRvh9YlBuKsbg2+gt14j7YH3RYxnm5jBOsEYz0eMa2s6iOMS/G/TbnvC9T8+ye2EXw=
X-Received: by 2002:a05:6e02:1cac:b0:3d0:4b3d:75ba with SMTP id
 e9e14a558f8ab-3d2cb42daddmr41475585ab.4.1740157597175; Fri, 21 Feb 2025
 09:06:37 -0800 (PST)
MIME-Version: 1.0
References: <20250221104538.2147-1-xiangwencheng@lanxincomputing.com>
In-Reply-To: <20250221104538.2147-1-xiangwencheng@lanxincomputing.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 21 Feb 2025 22:36:25 +0530
X-Gm-Features: AWEUYZko5N5M7hatn6QenhvKduK_Aqv3UdJMpX2Lv711NP2hVkEu-tpphWsd27g
Message-ID: <CAAhSdy34iNEqcVOziJcjnhS5xTYx3o+iXex8bEAwmUDApXWAcg@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: KVM: Remove unnecessary vcpu kick
To: BillXiang <xiangwencheng@lanxincomputing.com>
Cc: ajones@ventanamicro.com, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, atishp@atishpatra.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, rkrcmar@ventanamicro.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_090639_024553_A9513199 
X-CRM114-Status: GOOD (  17.62  )
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

T24gRnJpLCBGZWIgMjEsIDIwMjUgYXQgNDoxNuKAr1BNIEJpbGxYaWFuZwo8eGlhbmd3ZW5jaGVu
Z0BsYW54aW5jb21wdXRpbmcuY29tPiB3cm90ZToKPgo+IFJlbW92ZSB0aGUgdW5uZWNlc3Nhcnkg
a2ljayB0byB0aGUgdkNQVSBhZnRlciB3cml0aW5nIHRvIHRoZSB2c19maWxlCj4gb2YgSU1TSUMg
aW4ga3ZtX3Jpc2N2X3ZjcHVfYWlhX2ltc2ljX2luamVjdC4KPgo+IEZvciB2Q1BVcyB0aGF0IGFy
ZSBydW5uaW5nLCB3cml0aW5nIHRvIHRoZSB2c19maWxlIGRpcmVjdGx5IGZvcndhcmRzCj4gdGhl
IGludGVycnVwdCBhcyBhbiBNU0kgdG8gdGhlbSBhbmQgZG9lcyBub3QgbmVlZCBhbiBleHRyYSBr
aWNrLgo+Cj4gRm9yIHZDUFVzIHRoYXQgYXJlIGRlc2NoZWR1bGVkIGFmdGVyIGVtdWxhdGluZyBX
RkksIEtWTSB3aWxsIGVuYWJsZQo+IHRoZSBndWVzdCBleHRlcm5hbCBpbnRlcnJ1cHQgZm9yIHRo
YXQgdkNQVSBpbgo+IGt2bV9yaXNjdl9haWFfd2FrZW9uX2hnZWkuIFRoaXMgbWVhbnMgdGhhdCB3
cml0aW5nIHRvIHRoZSB2c19maWxlCj4gd2lsbCBjYXVzZSBhIGd1ZXN0IGV4dGVybmFsIGludGVy
cnVwdCwgd2hpY2ggd2lsbCBjYXVzZSBLVk0gdG8gd2FrZQo+IHVwIHRoZSB2Q1BVIGluIGhnZWlf
aW50ZXJydXB0IHRvIGhhbmRsZSB0aGUgaW50ZXJydXB0IHByb3Blcmx5Lgo+Cj4gU2lnbmVkLW9m
Zi1ieTogQmlsbFhpYW5nIDx4aWFuZ3dlbmNoZW5nQGxhbnhpbmNvbXB1dGluZy5jb20+CgpRdWV1
ZWQgdGhpcyBwYXRjaCBhcyBhIGZpeCBmb3IgTGludXgtNi4xNC1yY1guCgpUaGFua3MsCkFudXAK
Cj4gLS0tCj4gdjI6IFJldmlzZSB0aGUgY29tbWl0IG1lc3NhZ2UgdG8gZW5zdXJlIGl0IG1lZXRz
IHRoZSByZXF1aXJlZAo+ICAgICBzdGFuZGFyZHMgZm9yIGFjY2VwdGFuY2UKPgo+ICBhcmNoL3Jp
c2N2L2t2bS9haWFfaW1zaWMuYyB8IDEgLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigt
KQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL2FpYV9pbXNpYy5jIGIvYXJjaC9yaXNj
di9rdm0vYWlhX2ltc2ljLmMKPiBpbmRleCBhODA4NWNkODIxNWUuLjI5ZWY5YzIxMzNhOSAxMDA2
NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS9haWFfaW1zaWMuYwo+ICsrKyBiL2FyY2gvcmlzY3Yv
a3ZtL2FpYV9pbXNpYy5jCj4gQEAgLTk3NCw3ICs5NzQsNiBAQCBpbnQga3ZtX3Jpc2N2X3ZjcHVf
YWlhX2ltc2ljX2luamVjdChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCj4KPiAgICAgICAgIGlmIChp
bXNpYy0+dnNmaWxlX2NwdSA+PSAwKSB7Cj4gICAgICAgICAgICAgICAgIHdyaXRlbChpaWQsIGlt
c2ljLT52c2ZpbGVfdmEgKyBJTVNJQ19NTUlPX1NFVElQTlVNX0xFKTsKPiAtICAgICAgICAgICAg
ICAga3ZtX3ZjcHVfa2ljayh2Y3B1KTsKPiAgICAgICAgIH0gZWxzZSB7Cj4gICAgICAgICAgICAg
ICAgIGVpeCA9ICZpbXNpYy0+c3dmaWxlLT5laXhbaWlkIC8gQklUU19QRVJfVFlQRSh1NjQpXTsK
PiAgICAgICAgICAgICAgICAgc2V0X2JpdChpaWQgJiAoQklUU19QRVJfVFlQRSh1NjQpIC0gMSks
IGVpeC0+ZWlwKTsKPiAtLQo+IDIuNDYuMgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3Zt
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
