Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34C4AD1A610
	for <kvm-riscv@archiver.kernel.org>; Fri,  9 Jan 2026 12:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XxLLWqaYomuQXW14x76FfWv0s8BEmvxigNThN2dvTQk=; b=qDYMbo4X842tI7
	QMHEh79hGK0FMoJpiRJEGM8g42WKDSDB3eSuNd/1akuM+Kqi3KNeoZChF7zRJwrKH6JW+EAJyHZi9
	e6cLkXEh14KwyQ/NTzTBHzqoQT41nzPuswlxLi1zm4sjxdUxXBprL9kRFVh2M0JTCXdcK3IUBkjpf
	QeyIqEmFs6KPwixrft1Ze7XfFqft6WuxO1QrKveEOPXgfmDuQiUZO+6Z1sB8r+qsviM4lT0jExEUB
	shlriV3e9PBsAst1l7On960ZTvfKuZUf61IDUNdzYPt614i5Azi3UP1aYaIRgSffw7M/QX90eMAcG
	/Itw7WwZWGPJYceUKNXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veBf2-00000002JGw-2rw8;
	Fri, 09 Jan 2026 12:32:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veBf0-00000002JGk-33N7;
	Fri, 09 Jan 2026 12:32:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C4D1C60175;
	Fri,  9 Jan 2026 12:32:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E38B0C16AAE;
	Fri,  9 Jan 2026 12:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767961929;
	bh=Gnps4QAJzsWyd1d0flxw0wp7BrfKE6qbMDYhxNfwSCg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=U7f4gKttWVnObpRY/GMglbRkuMybrifWFIEJzZgU7rW/Ttk+ji8HEmmhi1xVTyrH2
	 3so17F46G1on/a17UJxoocOnOjrkpAMX+PP5V+sGRDSODavGwnYh8lyEiHOdSkuo4Q
	 JNnfMseyLIna1/3L7JeaEj/PcjHQuURETTS7QhFUPLXZjxeY+SOkrNUueuoKolkWiA
	 cm4PQhrFSM1W8OqxC6p3Ux8HTDA6GZYnDbQ8GNouKd6TTfHX41e6RJxboEUtPuQlaC
	 QqzSauz4nHc7lIFQkccJ0YT1NzdGmpU/7sq9fudS2yN2JbvF9pLYD5ku0s6jKBSZts
	 7N2lVCziHIsGw==
From: Thomas Gleixner <tglx@kernel.org>
To: Anup Patel <anup@brainfault.org>, Xu Lu <luxu.kernel@bytedance.com>
Cc: atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] irqchip/riscv-imsic: Adjust the number of available
 guest irq files
In-Reply-To: <CAAhSdy0dcMhmENZ9cMkE7Rh8u93sRiYozxEWgJ0tvHVUiRdykw@mail.gmail.com>
References: <20251222093718.26223-1-luxu.kernel@bytedance.com>
 <CAAhSdy0dcMhmENZ9cMkE7Rh8u93sRiYozxEWgJ0tvHVUiRdykw@mail.gmail.com>
Date: Fri, 09 Jan 2026 13:32:05 +0100
Message-ID: <874iovrmpm.ffs@tglx>
MIME-Version: 1.0
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

T24gU3VuLCBKYW4gMDQgMjAyNiBhdCAxODo0NiwgQW51cCBQYXRlbCB3cm90ZToKPiBPbiBNb24s
IERlYyAyMiwgMjAyNSBhdCAzOjA34oCvUE0gWHUgTHUgPGx1eHUua2VybmVsQGJ5dGVkYW5jZS5j
b20+IHdyb3RlOgo+Cj4gUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5v
cmc+Cj4KPiBAdGdseCwgSXMgaXQgb2theSB0byB0YWtlIHRoaXMgdGhyb3VnaCB0aGUgS1ZNIFJJ
U0MtViB0cmVlCj4gc2luY2UgdGhpcyBjaGFuZ2UgZm9jdXNlcyBvbiBndWVzdCBmaWxlcyB1c2Vk
IGJ5IEtWTSA/CgpTdXJlLCBpZiB0aGVyZSBhcmUgbm8gY29uZmxpY3RzIGFnYWluc3QgdGlwIGly
cS9kcml2ZXJzLgoKQWNrZWQtYnk6IFRob21hcyBHbGVpeG5lciA8dGdseEBrZXJuZWwub3JnPgoK
LS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
