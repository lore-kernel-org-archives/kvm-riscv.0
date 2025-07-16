Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74806C83F27
	for <kvm-riscv@archiver.kernel.org>; Wed, 16 Jul 2025 12:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zqjG0s+YJ/jpUQuV7Akc4Hy6PxspauaDX3Uj+OLjOcw=; b=1bVbwF6s5RtcOE
	S93ZBLM0V316hxxtJ0rcKjyPVKuWE6bFeHOxTEq8GW8Die7r/ix5MLKxLXlAAEM8cLLGi6rQdEbrt
	Hb+2lhcATz4L5VBBdaZRpBrBNesi9ukaypw1VGgY5zJHzlgH/8UigU40RxC4KUQheqtaTybh+dfZy
	zwVTtAU1msF84tri0gwgODV37idoWzblxcrYoogLjNrN+GfHdXDQRzMg32VTrcKLf/egNpm7uo0kh
	I8AFZbFrQZLxLQXRXaDL6Eao31E43ENf55npAlE+0moS75vU8k4vWn7T/75N9sJeov7RS3m1m9YmK
	w/ZjuZ2PyAq0M/icRIzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc1Bz-00000007eOj-0N3z;
	Wed, 16 Jul 2025 12:24:59 +0000
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc1Bv-00000007eO1-3zmr
	for kvm-riscv@lists.infradead.org;
	Wed, 16 Jul 2025 12:24:57 +0000
Received: by mail-io1-xd2e.google.com with SMTP id ca18e2360f4ac-875f28fde67so575094739f.1
        for <kvm-riscv@lists.infradead.org>; Wed, 16 Jul 2025 05:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1752668695; x=1753273495; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ufN3hObMca4GLsjT1dwHltCBaXf3kFOYG4s7v4Jw4M=;
        b=KRDL265QwD83HkfMZc+8besRaw+17u2wzU93rNIR2+aU63DT5YgZZ6tPW9kJ5cJBxj
         cbqNeD8aQBCFxh+mtkTahXeU5sQlr6Jx1FftWeqisAlDAk/ZJRSFc+KCb72ISotkfuo8
         HpMGkPqy922e0ICHAJFnWsKBxr0hRbKa92HmPDctfnonxh6Zp4EAZQFbxNh+qE63jyF6
         j7eVjI/+R41Sfoqpl3fO4BvdnHRmtwCfC6eYgwWgF33FseWXr1Q1BdtRhcJnTzxbf79+
         scb+MU6d21CdTXTzUg5zOiQi1NsxaSC8vebAhILzPpOWO7mqxiOOpxJeNDGI5wyKBOmr
         c14g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752668695; x=1753273495;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ufN3hObMca4GLsjT1dwHltCBaXf3kFOYG4s7v4Jw4M=;
        b=NLBR6HV+wUHnvLpBPJrklqhuDbFCKGFilhiCdUv8OQsbTTry0dO+p+TVQaQKpAfXe5
         eJtfxxBhU3BK/+s2B1G9zhyi7WIHJVjavhDKYl+JaJLTQKF3DxmP4TJZLbdqo9LwsTjR
         /CBvO8qp4Y06wYUIOlNusPF5toXeoK7nyq2xXUhJ6y3VDxyv2rOi1mzv8QvZ8Ir7x0Y1
         hYi1B0u0oORBrZdqMap2ilwQiDtUg+3IZZ4ixQfCiOIpaIR8AqJ3ATjPelnUciZA+b3X
         kcHvJAYyXILS2uqdtrOrf8x0Sqx4xsckgALNz4bgW0OrYSNLTqwP5WdFdOc8hZeEqArb
         Jdvg==
X-Forwarded-Encrypted: i=1; AJvYcCUfZNCJQyOZZQb0+MG+9U5aU9RPJrWQqXnP4HOmzx4jPZlc56KcCgd+Y2Mk0V8pckvSfQZzxwlDTdM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5pt9wjrYF0+6osNTSpPHs1g8qdQGj4K2Hf8IjvwG8VMZV3HsG
	WjAjtx8kcLsZWvR4aHh4Pi/KsTJlYcXWiywFIJZ7XR4rBXULnLiP1bvHSyHQ9RVciPNv3NSz71N
	EoXeWoQjyNr395WxNjOSr28E5yhefpVhNDICdryqvVQ==
X-Gm-Gg: ASbGncszNxb+JUIT+agbz/nR3ldMO8M7KPuk4+Uwe92eHvyjmUfbyJdEvLzLfDCUfXK
	tVCBcpg79eG7xExoblxBX9hLenW5AZ+9PIB2Tb+DSZ4quWNNIe7b9NTYbTmwCoYvKLSWsQjtE3h
	tYufWlOvxHTLZki+bTc1/Ag5Ni8hXYL87cLt6lDKVOw1h0KsQMEdBMHRdFhbu/Ti+GNpUiNbpxW
	qGqX3g=
X-Google-Smtp-Source: AGHT+IHcBKm14IqMY2zZCku6eJ3aL9uOlgyeZlrEeJEsEb6pBAtDYAiLwB4M4psg96+hNqoIYo09iBakwOdp9w74hpw=
X-Received: by 2002:a05:6602:154d:b0:879:572e:238c with SMTP id
 ca18e2360f4ac-879c091cc40mr370204539f.9.1752668695035; Wed, 16 Jul 2025
 05:24:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250111004702.2813013-1-samuel.holland@sifive.com>
In-Reply-To: <20250111004702.2813013-1-samuel.holland@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 16 Jul 2025 17:54:43 +0530
X-Gm-Features: Ac12FXw5fRuKRk9Gh9hKxwhWqS2DR3ZACynLX0_VX_3TVKCKPIkjC2p2q_9ELUM
Message-ID: <CAAhSdy2x+bskK2Du-ys7TCeih=QEFRkkydg2VYGZniEt3zW3=Q@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] RISC-V: KVM: Pointer Masking Support
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Atish Patra <atishp@atishpatra.org>, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, Albert Ou <aou@eecs.berkeley.edu>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_052456_223982_125A6988 
X-CRM114-Status: UNSURE (   8.59  )
X-CRM114-Notice: Please train this message.
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

T24gU2F0LCBKYW4gMTEsIDIwMjUgYXQgNjoxN+KAr0FNIFNhbXVlbCBIb2xsYW5kCjxzYW11ZWwu
aG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPgo+IFRoaXMgc2VyaWVzIGFkZHMgc3VwcG9ydCBm
b3IgcG9pbnRlciBtYXNraW5nIGluIFZTLW1vZGUgaW5zaWRlIEtWTQo+IGd1ZXN0cyB1c2luZyB0
aGUgU0JJIEZXRlQgZXh0ZW5zaW9uLiBUaGlzIHNlcmllcyBhcHBsaWVzIG9uIHRvcCBvZgo+IENs
w6ltZW50J3MgInJpc2N2OiBhZGQgU0JJIEZXRlQgbWlzYWxpZ25lZCBleGNlcHRpb24gZGVsZWdh
dGlvbiBzdXBwb3J0Igo+IHNlcmllc1sxXSwgd2hpY2ggYWRkcyB0aGUgbmVjZXNzYXJ5IGluZnJh
c3RydWN0dXJlLgo+Cj4gWzFdOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8y
MDI1MDEwNjE1NDg0Ny4xMTAwMzQ0LTEtY2xlZ2VyQHJpdm9zaW5jLmNvbS8KPgo+Cj4gU2FtdWVs
IEhvbGxhbmQgKDIpOgo+ICAgUklTQy1WOiBLVk06IEZpeCBpbmNsdXNpb24gb2YgU21ucG0gaW4g
dGhlIGd1ZXN0IElTQSBiaXRtYXAKPiAgIFJJU0MtVjogS1ZNOiBBZGQgc3VwcG9ydCBmb3IgU0JJ
X0ZXRlRfUE9JTlRFUl9NQVNLSU5HX1BNTEVOCgpMR1RNLgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0
ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpSZWJhc2VkIGFuZCBxdWV1ZWQgaXQgZm9yIExpbnV4
LTYuMTcKClRoYW5rcywKQW51cAoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9rdm0tcmlzY3YK
