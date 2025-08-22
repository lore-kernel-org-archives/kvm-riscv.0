Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55C98CA0EFF
	for <kvm-riscv@archiver.kernel.org>; Fri, 22 Aug 2025 15:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fkmDJvXO59OhfLRGii07TklilTtEmApQl6AM4svWaXM=; b=J12ZGZfCIrCK/E
	w/EDu1dC5pMKp64/6QYsrLnot4wTQXaJFW74QQpTyZ/QBYlAaITSGLl71cGb5m/i5NvxOyZRvXE7q
	KbzXr06sP4QVU3YbiUvaCyvVYaQhpGZEl/gaDbZOw/tjT8yKsFpi7VboKj+eX5/P9egCPN52n29II
	u26zNO5mjbg406h1zA0vUXX6olIxFrRAqjkgDZ6wQurWoIQycVZofSgY20bhNcHLxlkAD78xDAtuN
	Js46mUOYCdfZlr5Pvq56tVheTLx+i3tJngAh8rqOlBHC5vjCHF5oFbvPjN4JONnNsrrU0u6WwtmNZ
	kjqXGwKoWLED2sLN+iAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upTxC-000000035qX-0MtT;
	Fri, 22 Aug 2025 15:45:22 +0000
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upPow-00000002HqE-2hVg
	for kvm-riscv@lists.infradead.org;
	Fri, 22 Aug 2025 11:20:35 +0000
Received: by mail-io1-xd2d.google.com with SMTP id ca18e2360f4ac-88432e6ca05so137028539f.3
        for <kvm-riscv@lists.infradead.org>; Fri, 22 Aug 2025 04:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1755861634; x=1756466434; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4/vfvb14CGNszwxeStpY4dH+U6nsuyg9PGBngcSjux8=;
        b=KK2zbnFj3YBe8ZWGOXZB6guhLRLZCwvOwAfyCLP9tKfKsbOmESounvmTMPDGHvGxWE
         e8H4j2tWGggcB8POPDf5evdS3X5lLDqeo9uoZ5UmDqItAtC84cwiOQGvemdEWqCCBgta
         /QwkyTYLjHsRjiM/JX/j7wA4VbFOhrG2SNS9N4nuMxZZpab7kgIP+poPjvWCS+REpf6l
         7B1nZ9J8E5zFA4iT0kGlUN1gNI9mbnzWuctRljpfZLLaOMNaKW0JYLkc7LI3zGk1a57/
         4qWniZkNmxspXdgaIY53apUs5xwH54cEtjga2YWfMHaavfVJkMHMTMxYJROcL1BXU6o/
         y7Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755861634; x=1756466434;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4/vfvb14CGNszwxeStpY4dH+U6nsuyg9PGBngcSjux8=;
        b=rgZuvMVQdSgzVUs4sE0iPyGGh9TF2BZ7TE3C6QqUe84aSQJsmdRkWe8E1WYKCNIN27
         xt/xIEXJK5G+Q/Qxc8uHFMIE9i7eRn9hO9jXE3g3WGXo72z7JeS2YxQ8wtbotsJcPeus
         RK3yLmQt7ap9xc2CwWOs+oYaBCctlhkhOjHUvh/oHmzLUdZ+xAGtqMGreIrR/p5Vzu3k
         fgx2Hx810GQBh0N3y+hxK1nlWQbPIE1+D3IbXN9zvY1U8msHrS+Qi1q7vca+LdS94zuB
         yD56Gmk/XmD2gyOrGQhRcCnAKWEyzxYydIj1NUe2ZMAUE18OOjh1wrRmyr2SMgpkM+25
         uEKA==
X-Forwarded-Encrypted: i=1; AJvYcCWWklZOUVrHiWpGmGnhSPz7MHM+1btflueaGrmoyhdL1Rcf73tglSq46EnlXmSTxNxwvgsRs5k803A=@lists.infradead.org
X-Gm-Message-State: AOJu0YwwgSHNOjSiZD0PttLT8Nb5nD1DY9b3FJMC3hJlEoNuhfh2ewR3
	rZT50PUbdfaHfHZ7SAqNFtaH+w1gYsN3TDO1iB9y4k380hziRLM2KvpAzO7rh9j7QC+XgjSbIT2
	cxng7KW8LT8CaPeB03sMSR0wGcLXFr7nRZFTCvVtt5Q==
X-Gm-Gg: ASbGncsawyjY0uleLoshl/t7IBi8u9hvGLiUlUkEdZQ+MHjA74bEBRyzRqPqyqSmUb9
	VFxRi0cThgtekbo9pUyqzEUG2jzo3o6LRPcUP3mdzUt09bdPpe4iAWx3BajUuOfMtCyjHnxN+D4
	XF8szE2QAwb2AOQtEazY1YvzLx+8OOFfh/vQvLWgL/EYk+luxyB4b4SB6R3hnCDOnx9OTM2+J1w
	6FjeOaT
X-Google-Smtp-Source: AGHT+IH6sSUh2jwMrj6GuWBxvwwTPiTBYkovYilK1h5/YeKQYLbFNsHzLiFIEtHdGgUpX3elX/k9WeCcNC+wsnPHQ84=
X-Received: by 2002:a05:6e02:1885:b0:3e6:6a43:1890 with SMTP id
 e9e14a558f8ab-3e91fc26d9amr43027185ab.4.1755861633631; Fri, 22 Aug 2025
 04:20:33 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1754646071.git.zhouquan@iscas.ac.cn>
In-Reply-To: <cover.1754646071.git.zhouquan@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 22 Aug 2025 16:50:21 +0530
X-Gm-Features: Ac12FXybuZh7H_EDZYZxjvBDpOJ1Lg5p3N7w9IhOsJAO1wqpnDrt-kCUdBS50To
Message-ID: <CAAhSdy1n+R5q3F4Fw4npz3gOGEWueYd0tDuPyzjE1stPATMdfQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] RISC-V: KVM: Allow zicbop/bfloat16 exts for guests
To: zhouquan@iscas.ac.cn
Cc: ajones@ventanamicro.com, atishp@atishpatra.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_042034_687666_F780A6DD 
X-CRM114-Status: GOOD (  12.40  )
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

T24gRnJpLCBBdWcgOCwgMjAyNSBhdCA0OjAw4oCvUE0gPHpob3VxdWFuQGlzY2FzLmFjLmNuPiB3
cm90ZToKPgo+IEZyb206IFF1YW4gWmhvdSA8emhvdXF1YW5AaXNjYXMuYWMuY24+Cj4KPiBBZHZl
cnRpc2UgemljYm9wL2JmbG9hdDE2IGV4dGVuc2lvbnMgdG8gS1ZNIGd1ZXN0IHdoZW4gdW5kZXJs
eWluZwo+IGhvc3Qgc3VwcG9ydHMgaXQsIGFuZCBhZGQgdGhlbSB0byBnZXQtcmVnLWxpc3QgdGVz
dC4KPgo+IC0tLQo+IENoYW5nZSBzaW5jZSB2MToKPiAtIHVwZGF0ZSB6aWNib20vemljYm96L3pp
Y2JvcCBibG9jayBzaXplIHJlZ2lzdGVycyB0byBkZXBlbmQgb24gdGhlIGhvc3QgaXNhLgo+IC0g
dXBkYXRlIHRoZSByZWcgbGlzdCBmaWx0ZXJpbmcgaW4gY29weV9jb25maWdfcmVnX2luZGljZXMo
KSB0byB1c2UgdGhlIGhvc3QgaXNhLgo+IC0gYWRkIHJlZyBsaXN0IGZpbHRlcmluZyBmb3Igemlj
Ym9wLgo+IHYxOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvY292ZXIuMTc1MDE2NDQxNC5n
aXQuemhvdXF1YW5AaXNjYXMuYWMuY24vCj4KPiBRdWFuIFpob3UgKDYpOgo+ICAgUklTQy1WOiBL
Vk06IENoYW5nZSB6aWNib20vemljYm96IGJsb2NrIHNpemUgdG8gZGVwZW5kIG9uIHRoZSBob3N0
IGlzYQo+ICAgUklTQy1WOiBLVk06IFByb3ZpZGUgVUFQSSBmb3IgWmljYm9wIGJsb2NrIHNpemUK
PiAgIFJJU0MtVjogS1ZNOiBBbGxvdyBaaWNib3AgZXh0ZW5zaW9uIGZvciBHdWVzdC9WTQo+ICAg
UklTQy1WOiBLVk06IEFsbG93IGJmbG9hdDE2IGV4dGVuc2lvbiBmb3IgR3Vlc3QvVk0KPiAgIEtW
TTogcmlzY3Y6IHNlbGZ0ZXN0czogQWRkIFppY2JvcCBleHRlbnNpb24gdG8gZ2V0LXJlZy1saXN0
IHRlc3QKPiAgIEtWTTogcmlzY3Y6IHNlbGZ0ZXN0czogQWRkIGJmbG9hdDE2IGV4dGVuc2lvbiB0
byBnZXQtcmVnLWxpc3QgdGVzdAoKUXVldWVkIHRoaXMgc2VyaWVzIGZvciBMaW51eC02LjE4CgpU
aGFua3MsCkFudXAKCj4KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oICAgICAg
ICAgICAgIHwgIDUgKysrCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfb25lcmVnLmMgICAgICAgICAg
ICAgICAgICB8IDM0ICsrKysrKysrKysrKysrKy0tLS0KPiAgLi4uL3NlbGZ0ZXN0cy9rdm0vcmlz
Y3YvZ2V0LXJlZy1saXN0LmMgICAgICAgIHwgMjUgKysrKysrKysrKysrKysKPiAgMyBmaWxlcyBj
aGFuZ2VkLCA1OCBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+Cj4gLS0KPiAyLjM0LjEK
PgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
