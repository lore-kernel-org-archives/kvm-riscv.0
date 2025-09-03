Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68A2ACA0FF2
	for <kvm-riscv@archiver.kernel.org>; Wed,  3 Sep 2025 19:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6g+TEEEntsUFX8P+Mbm5SQE66BSpmQUWCkdNF2aayd8=; b=McP6b/nHRS/P6i
	ch2eWgA81FQuOGeBhOwfL8v6ku7aMrP1yArj+zHMtYJgptHvci4T5xK4Qq8gTMeLzHX2mYn/S2Elw
	p83cUPuzETw31rXXjIo1gnQDFUn8k7gpye2jsBEqol9qIS0QqMnWLkTX5vrNFS8G5AvLpY8XDgHF3
	arc0ztNgCATubV6LhNE84ko5cFkHsLD2Edp5MVl6Vu3lfJClsF+yOHwXw8rRrNUPzXQIvuV7eifOa
	BUXTaeGioKC8FdOr8VUfcfi70kpDRYiiuZ3W5AWjv+JCRgCjH98cyVfzN2oHw8Tu/dd+kQLKYJbXa
	3fBM6x+lDgUi4CAbkKrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utt0R-00000007QvR-0cOY;
	Wed, 03 Sep 2025 19:18:55 +0000
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utoWc-00000006jze-26pT
	for kvm-riscv@lists.infradead.org;
	Wed, 03 Sep 2025 14:31:52 +0000
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-3f38bafe6ddso28348805ab.1
        for <kvm-riscv@lists.infradead.org>; Wed, 03 Sep 2025 07:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1756909909; x=1757514709; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+xK1Ixt22UPQpRV6eJF15nySq1ENYn93GAeXzGVGJzQ=;
        b=HS10yvRhALYRTlIYhA3IQOSs3VeFdsMN11ggNjyRTZ7BMolCr7amynq+Vl3Jlp9IUJ
         /KwTmG82xEwyP1U4OBYmbXh167AqNmwr860zWpUoQv5zfn+JMMXLsJdFFR6dwPhV+GW5
         JkuYH0dBbmSS8cQpEWwRDid9nV7WIptR8bLmaL5HKTIxYJti+HTNEiWAefkcPv5y8V/5
         6iplWPyhbstrBhtLYgV3rS8bKhv+rWkk+NEJUAPct8Udy+OI7G8j/88Y2cumNPiYk3z5
         bE6r1ZxI6tXGmitO98U6SJ2ghU2ZB5VEWiHJig61adrEaeTGC5uJ2A23aq8wZHJOEPCe
         0KMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756909909; x=1757514709;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+xK1Ixt22UPQpRV6eJF15nySq1ENYn93GAeXzGVGJzQ=;
        b=TFzTj/T6oBB8EbVHvymcM7pJXs97b1ZXAgmIFVhkdvSc29yGNfSyyOqxDLjulcpy9d
         mWkjX8N0ol31A9A6544ZN9y7FvdZZ9VhsrWARTwOfOrlB8WZg6y//qHJodzfomcc7nEi
         OFYxK44HSjcXmXIGBgErCVsICQJui3K+vgvE6cFh4vZf/Bunjmew92HQBQLYuN62BVXi
         Ue81ZXtiNuVTzmUNt16m6scHAzYZ5tWEOwhnoiWmkpzeUPbFBRutWb5GNi9MD/06EwLJ
         ibb2NUHid+APRKf9AUUpFxAizOU4vqAEh7kmaOMqSdfphii0Q/6ZAFxGF4IAtkNIGpLx
         hcJg==
X-Forwarded-Encrypted: i=1; AJvYcCVJq2UQERGoWNJEk0qEG0AjtO4h2T5BO86z9jj0/Tlzl/1raszuo/ubHeo+4cEcIVl0A858OH2n7fQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YwmJ8NP6B8KvmFvOTUVKdWWovNxg9e89ynHoTaDghduKTqAGE4Q
	Yds/MZD0K/uBfM7w5luptbJSnDb7u8bnozfPv3XqZuGphzv27EEFN3/BjrCExPgexqPZZ0Qw533
	E1NJVbEz/5y15GR73W7qDxZvAaBFZkuXjo71xJ6kc0Q==
X-Gm-Gg: ASbGncuAmKVhcej9gxSSf8D0hyL5zrCfsh50TWRAfjfIiiElK1xkMJw10jSMlIHgzUR
	UB8JHH4hlS080/cGDubz/HM8bBdhI+b0AJFQFxmSjP5LKYcL8HKzQOYos/TlBHoIsHeIku5B2u2
	5Rilw1Rt9w6PXna2+3A4U3BSJvGuaOSymnzCM0bqd7C/8IwMbN0KnHc6qEjuAGAUS0bvSDFh4iL
	7cLELAaU+E0XPHC/gYX3fmXp0yT/2sLn5HDgYvQryCgC8JRhlfqEDuuWYTESw==
X-Google-Smtp-Source: AGHT+IEdqptgFgnh5uv2GzzQGJFqAZUOszFTkmnyBR24wl/TgHUrHJeCtE9hinNDxe7tcZMD8cJExtpH41CpN+afzKw=
X-Received: by 2002:a92:ca4a:0:b0:3f2:1a77:4876 with SMTP id
 e9e14a558f8ab-3f4024cb129mr260307905ab.26.1756909909294; Wed, 03 Sep 2025
 07:31:49 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1756710918.git.dayss1224@gmail.com>
In-Reply-To: <cover.1756710918.git.dayss1224@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 3 Sep 2025 20:01:37 +0530
X-Gm-Features: Ac12FXwG5rgdOIo0vaX3JEvtxdbhO8ebAqv0PdEvBcoUhtsHNdiKMQlA4BgxMFY
Message-ID: <CAAhSdy0DriNa-90QO_YgUbuxrjkDSQ_iTtNVG5ie0h09y2xSHA@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] KVM: riscv: selftests: Enable supported test cases
To: dayss1224@gmail.com
Cc: pbonzini@redhat.com, shuah@kernel.org, atish.patra@linux.dev, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_073150_778129_B755AE49 
X-CRM114-Status: GOOD (  11.07  )
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

T24gTW9uLCBTZXAgMSwgMjAyNSBhdCAxOjA24oCvUE0gPGRheXNzMTIyNEBnbWFpbC5jb20+IHdy
b3RlOgo+Cj4gRnJvbTogRG9uZyBZYW5nIDxkYXlzczEyMjRAZ21haWwuY29tPgo+Cj4gQWRkIHN1
cHBvcnRlZCBLVk0gdGVzdCBjYXNlcyBhbmQgZml4IHRoZSBjb21waWxhdGlvbiBkZXBlbmRlbmNp
ZXMuCj4gLS0tCj4gQ2hhbmdlcyBpbiB2MzoKPiAtIFJlb3JkZXIgcGF0Y2hlcyB0byBmaXggYnVp
bGQgZGVwZW5kZW5jaWVzCj4gLSBTb3J0IGNvbW1vbiBzdXBwb3J0ZWQgdGVzdCBjYXNlcyBhbHBo
YWJldGljYWxseQo+IC0gTW92ZSB1Y2FsbF9jb21tb24uaCBpbmNsdWRlIGZyb20gY29tbW9uIGhl
YWRlciB0byBzcGVjaWZpYyBzb3VyY2UgZmlsZXMKPgo+IENoYW5nZXMgaW4gdjI6Cj4gLSBEZWxl
dGUgc29tZSByZXBlYXQgS1ZNIHRlc3QgY2FzZXMgb24gcmlzY3YKPiAtIEFkZCBtaXNzaW5nIGhl
YWRlcnMgdG8gZml4IHRoZSBidWlsZCBmb3IgbmV3IFJJU0MtViBLVk0gc2VsZnRlc3RzCj4KPiBE
b25nIFlhbmcgKDEpOgo+ICAgS1ZNOiByaXNjdjogc2VsZnRlc3RzOiBBZGQgbWlzc2luZyBoZWFk
ZXJzIGZvciBuZXcgdGVzdGNhc2VzCj4KPiBRdWFuIFpob3UgKDIpOgo+ICAgS1ZNOiByaXNjdjog
c2VsZnRlc3RzOiBVc2UgdGhlIGV4aXN0aW5nIFJJU0NWX0ZFTkNFIG1hY3JvIGluCj4gICAgIGBy
c2VxLXJpc2N2LmhgCj4gICBLVk06IHJpc2N2OiBzZWxmdGVzdHM6IEFkZCBjb21tb24gc3VwcG9y
dGVkIHRlc3QgY2FzZXMKClF1ZXVlZCB0aGlzIHNlcmllcyBmb3IgTGludXgtNi4xOAoKVGhhbmtz
LApBbnVwCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1y
aXNjdgo=
