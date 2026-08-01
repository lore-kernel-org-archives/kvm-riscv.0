Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CC64C54FCD
	for <kvm-riscv@archiver.kernel.org>; Sat,  1 Aug 2026 06:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EU9phYAHqWEMNUtNZIYX07Zy4cy+uvmlkXqH/wXAen0=; b=w9p8CwYcbBWme4
	4K0r47gSKUGCra9AFNrwvl3CPxeuPQADFla9u0XCeu1nV9ej8FEJiVm5Dqw9oaXJwzKruZjAtPT//
	5IiqT1jG8KmwIR7AO3kbbG+T7X14VQtONzmAqDhtHXATquzfuMn+6tZl7d7ZFGcaClCe4MtHGHaLW
	o6reU1akA4n4Zl7s1SIhPs5zpZRtEy4mU6HylPW2egDqIcwdk96xcYXyEZrRJWZVSQbuO1+B+MouK
	fUhBROAO1CZ9QUJ8SXXldXkdVRZf+6A7e0SMqjkqZXlHlB77r1o8jERo2gLnTnxrgMcYwLNmfNSv1
	bWhyGx1iA9WoOmpPlIlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq3Ld-0000000Dx1j-2bos;
	Sat, 01 Aug 2026 06:37:29 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq3Lc-0000000Dx10-0GAX
	for kvm-riscv@lists.infradead.org;
	Sat, 01 Aug 2026 06:37:29 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-476a130c138so2123855f8f.0
        for <kvm-riscv@lists.infradead.org>; Fri, 31 Jul 2026 23:37:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785566246; cv=none;
        d=google.com; s=arc-20260327;
        b=I173cy0eGTNN6BtJC23U8+S6LbQ/5u1Fcjcl0zHpg+DwdcuQZzr4DBH46sEHKWjaA+
         Y4n5mxTqvNU7p2M7K9jGA93UEBlyGnpD2yQwChQEbo7vxLret1JRHS380f1dR2JrUYOd
         JjyJdNQhP1w2bGO7WeTPyn5cCXrMhlgncNkTs3Crd+nACbzRpI37y0RsgrIgptrgaFCw
         WMdQm/br+ICFiIkgbyaY6/xbHanjgvQ0oz4RQsgb/Whalmh43G/99Nr235N3FTYWyq1n
         PoBzvaEqZkJJycJasu/8uVd/4s3okqa/nZryB99m1nvAqCmo6Q7tgt8xbZkwbNnL9QWm
         r74A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZEEKMLrjFoxO4qfPv7PbynqOhcso35VDiGgwdeu5AIA=;
        fh=xUaBFYcna8hpVc/PusOXgGHqPMDKYWsKOhq6/Qcaf5c=;
        b=PBWtkYfefPMZrrtv/eV9in7PtDZwzMiPd/1po3gjzb2O1qMIxWXrcUNxqNFq0hldP6
         3eDD5VCxGUPi2MpYP/sZdwT5ustlhe8EwPhag29NxjZoz22ZZG6fZFag629MAPK6Iltg
         s2lwmSxwXgTKXFR22iiphVQ2ehzW23NmpqDCtYs//oG9ym0iC2gqKtmreDDj1OEeLVo7
         /r5EJnGhf7scI2hzFHZn0wk2YzHvG1zDDgsAiPjB21rak4YTHKD/f8RBW2wsk8a/kxbU
         +akicwyka4TkDShKYThjgp1ShLrpvg8u9YRgvla5bsHAfzAR/2VsgbXY8nbSX+WLiNqq
         giZA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1785566246; x=1786171046; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZEEKMLrjFoxO4qfPv7PbynqOhcso35VDiGgwdeu5AIA=;
        b=eNFMA/WybqaKXfSSRl0mp/CBoRsO3HdXTN/4qy1U4TSnfdxYXVtYkF3xqbXMCgne4l
         qmdoIsX1ufQT4ZcXfpZs3iaqoGMre7Xku7gVpN3Ws02ybds6S2CuegvYk/4igF9Arkr6
         auDJ0UrFlL05R8mxuWIDpcDyuSOuSWx34f+ESl8AZNwN63UQr34J4CJlHNZlGhphVlhf
         lIpu/aicbGUFYiXYuxGoLDaiOAJLDhryTcIhbWicgepXmas+KqJwidnDxYvVww9MsVxJ
         hfltTbRj5J7bAUE3j02TONzgDNQR9QNzQ5ECDD06t6Ot4Bwwu7vbjVHNZX451rCaJxBe
         LrGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785566246; x=1786171046;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZEEKMLrjFoxO4qfPv7PbynqOhcso35VDiGgwdeu5AIA=;
        b=ChkG2XRGMmIwP/R5TN0OvSEOHQ+0qqLnZ+gMzTjSpjUhB1zeHnjjl+IE78N9uoC2/S
         +g0KmGNU7jylPrNct9Q0POgY3ki1TZ0Bfgjgbg3vH7378mhxh7gj22osxV2dNlImIBiu
         9EpD9iXUFv5KI9jJFQJIneDiJfoz4R2Vn1EBVB/hdtYFnK6gfb0nCuMnBy4mzKnMsfL+
         q87OqcGBDiKcBssHoaPXeuZmXATA5e7tAFbXUYnzgV6NLexbczWNAx5oH1yk9883PZ9e
         xVSenF0/5U+peP4u3EaEyoBCbcv8ytxhoeNB7m8jhkzRsA7e8bdZaK8MYj8bfgBHyAYE
         CP5A==
X-Forwarded-Encrypted: i=1; AHgh+RqWCC7XhXxqF+B+SYgxPWZ1yeC/Nfbp+55Yho1VHm9sVNMbskupctYi431Tx56r1sJdusXH2/HN2zM=@lists.infradead.org
X-Gm-Message-State: AOJu0YzFrlnybt3TfYXJeTPH76ga1rjoO67k1xpJ6ccnbbGjQ/RKYIFS
	EPer5eBJ33MKlXj4PlWtW+D+NSnO2XSJx7p2zFGv6e3q1Lw4bOpI6ltc9IopQ77RfYzjTs2REGf
	7b3heMTQF1xGs53XwlSOD6o6wdOpCcMxnNWqhz2iKdw==
X-Gm-Gg: AR+sD13p9YAo+S9K6yJousj+ATDyQWP3yEx+TH1LOMfjHbgRmuckn/KpEMJKKWFI4dJ
	I/ELTZkP7Yp92+7+7F78d7jYNEA0ptVgMkg4dyCGzFxswY2LQPVhpwOZ2Ctb9Nz0ywBT0CbIM00
	CMJihbu3j+XVMtJpA3WyT+XUc9VC/Ntk6Bt+SAMdiQc+mIJ3ohMx4jOGiAuBTv0a9nM2sU+P5Cu
	jNJkfP5Dtj0ounCkDnqDa9ZUOnotCY0k56IIxuJoUO0nalHrJkeOcO+UEnCs6zHCq8utptUgm9n
	xKwK4uaBIjNCHX4F8zj28RqRczBHTjaNZTDa7lmCR4D3QHBpBLZ8VteBGUxJxZHVyNzC+bV/aOc
	Qh3wVvWzhkN7el3Y2ozJpEf5NoydXPN2gawIJF05bsLeyr2oJG5JGV5uVQtchCfNR+V0y4h0BsA
	s=
X-Received: by 2002:a05:6000:29d5:b0:47f:9266:9bde with SMTP id
 ffacd0b85a97d-47fd72a8ee0mr3499962f8f.4.1785566245613; Fri, 31 Jul 2026
 23:37:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260731091215.1549430-1-wang.yechao255@zte.com.cn> <20260731091215.1549430-2-wang.yechao255@zte.com.cn>
In-Reply-To: <20260731091215.1549430-2-wang.yechao255@zte.com.cn>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 1 Aug 2026 12:07:14 +0530
X-Gm-Features: AUfX_mz71aCqhPqjPcVLhtR6XkG82Dg8vgNGUVKpq_m_RdgeZktITFDomZMeZYo
Message-ID: <CAAhSdy1d_7w4vJS9CfuSJg6o9CYgnn8j-Bky-KtcCwuP2oo0Hw@mail.gmail.com>
Subject: Re: [PATCH v5 1/5] RISC-V: KVM: Add the split page cache for ioctl context
To: Wang Yechao <wang.yechao255@zte.com.cn>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_233728_134175_BA5C8250 
X-CRM114-Status: GOOD (  14.25  )
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

T24gRnJpLCBKdWwgMzEsIDIwMjYgYXQgMjo0NuKAr1BNIFdhbmcgWWVjaGFvIDx3YW5nLnllY2hh
bzI1NUB6dGUuY29tLmNuPiB3cm90ZToKPgo+IEFkZCB0aGUgc3BsaXQgcGFnZSBjYWNoZSBmb3Ig
ZGlydHkgbG9nZ2luZyBlbmFibGVtZW50IGFuZCB0aGUKPiBLVk1fQ0xFQVJfRElSVFlfTE9HIGlv
Y3RsLgo+Cj4gU2lnbmVkLW9mZi1ieTogV2FuZyBZZWNoYW8gPHdhbmcueWVjaGFvMjU1QHp0ZS5j
b20uY24+CgpMR1RNLgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5v
cmc+CgpUaGFua3MsCkFudXAKCj4gLS0tCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2hv
c3QuaCB8IDEgKwo+ICBhcmNoL3Jpc2N2L2t2bS9tbXUuYyAgICAgICAgICAgICAgfCAzICsrKwo+
ICAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3YvaW5jbHVkZS9hc20va3ZtX2hvc3QuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3Zt
X2hvc3QuaAo+IGluZGV4IGUyZDU4MDgxNjllNDQuLjcxZTQ1NWQxNjY5MDUgMTAwNjQ0Cj4gLS0t
IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1faG9zdC5oCj4gKysrIGIvYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9rdm1faG9zdC5oCj4gQEAgLTg2LDYgKzg2LDcgQEAgc3RydWN0IGt2bV9hcmNo
IHsKPiAgICAgICAgIHBnZF90ICpwZ2Q7Cj4gICAgICAgICBwaHlzX2FkZHJfdCBwZ2RfcGh5czsK
PiAgICAgICAgIHVuc2lnbmVkIGxvbmcgcGdkX2xldmVsczsKPiArICAgICAgIHN0cnVjdCBrdm1f
bW11X21lbW9yeV9jYWNoZSBwZ2Rfc3BsaXRfcGFnZV9jYWNoZTsKPgo+ICAgICAgICAgLyogR3Vl
c3QgVGltZXIgKi8KPiAgICAgICAgIHN0cnVjdCBrdm1fZ3Vlc3RfdGltZXIgdGltZXI7Cj4gZGlm
ZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL21tdS5jIGIvYXJjaC9yaXNjdi9rdm0vbW11LmMKPiBp
bmRleCA4YTBhYTVlMGUyMTZlLi4yMDE3ZDI5MmY0Y2E3IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlz
Y3Yva3ZtL21tdS5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vbW11LmMKPiBAQCAtNjc3LDYgKzY3
Nyw3IEBAIGludCBrdm1fcmlzY3ZfbW11X2FsbG9jX3BnZChzdHJ1Y3Qga3ZtICprdm0pCj4gICAg
ICAgICBrdm0tPmFyY2gucGdkID0gcGFnZV90b192aXJ0KHBnZF9wYWdlKTsKPiAgICAgICAgIGt2
bS0+YXJjaC5wZ2RfcGh5cyA9IHBhZ2VfdG9fcGh5cyhwZ2RfcGFnZSk7Cj4gICAgICAgICBrdm0t
PmFyY2gucGdkX2xldmVscyA9IGt2bV9yaXNjdl9nc3RhZ2VfbWF4X3BnZF9sZXZlbHM7Cj4gKyAg
ICAgICBrdm0tPmFyY2gucGdkX3NwbGl0X3BhZ2VfY2FjaGUuZ2ZwX3plcm8gPSBfX0dGUF9aRVJP
Owo+Cj4gICAgICAgICByZXR1cm4gMDsKPiAgfQo+IEBAIC03MDQsNiArNzA1LDggQEAgdm9pZCBr
dm1fcmlzY3ZfbW11X2ZyZWVfcGdkKHN0cnVjdCBrdm0gKmt2bSkKPgo+ICAgICAgICAgaWYgKHBn
ZCkKPiAgICAgICAgICAgICAgICAgZnJlZV9wYWdlcygodW5zaWduZWQgbG9uZylwZ2QsIGdldF9v
cmRlcihrdm1fcmlzY3ZfZ3N0YWdlX3BnZF9zaXplKSk7Cj4gKwo+ICsgICAgICAga3ZtX21tdV9m
cmVlX21lbW9yeV9jYWNoZSgma3ZtLT5hcmNoLnBnZF9zcGxpdF9wYWdlX2NhY2hlKTsKPiAgfQo+
Cj4gIHZvaWQga3ZtX3Jpc2N2X21tdV91cGRhdGVfaGdhdHAoc3RydWN0IGt2bV92Y3B1ICp2Y3B1
KQo+IC0tCj4gMi4zOS4zCj4KCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8va3ZtLXJpc2N2Cg==
