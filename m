Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEB70C54FCD
	for <kvm-riscv@archiver.kernel.org>; Sat,  1 Aug 2026 08:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LfDW9Wt95yv0BzCLnV9fYnFkVpLbQyF1kfs9WksFYSY=; b=s8QjtA2rIqFwLO
	+vb8lOI3SrC3UBJf5TuedpU6H5bcdXYcMliQX2SGrPCzo9oKsKnVslb7yeY++LwM94KtriNrenpBQ
	0bc2HiFIMH1WDlbdF5kKtjA499sVQWd0Ef+g+/A58y8nnxR+8xwi0SnJojjVw7N+qR11VP/si7dm1
	Hw5sGz1BIURAFRskCl8faRKQN2gMO0doH1o/AlHrci/cUHT4hdhzW8CTspTy1YFksqpUwPwNLaNh8
	4QxwGNwcZ1nh3VsaF7aVDUxS7BNYs98yijGy8Bg1HfGNUhk2FK5t22Sz6LF+LdAfeVhquUBvTFnm2
	7KWrP4KVo7OUzMP7IHnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq5CV-0000000E3j9-1D8o;
	Sat, 01 Aug 2026 08:36:11 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq5CS-0000000E3hH-34Cf
	for kvm-riscv@lists.infradead.org;
	Sat, 01 Aug 2026 08:36:10 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-5aebd52488cso1854935e87.2
        for <kvm-riscv@lists.infradead.org>; Sat, 01 Aug 2026 01:36:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785573367; cv=none;
        d=google.com; s=arc-20260327;
        b=in7W5FcuJaDsEKs9CUvT4lCbtk4MUNA97xbtebVlKQbETkopewFkaZQmPUNORYHCJX
         RC3KoBl+kLYt2YM/Hq31pFNWQz7YKJ1U8F0/UscW+vfFkHY3ANV78zI45tUCwNmLhww1
         aejgmW5SD2YIDIRBXtwXCb8z0eNb7iD24008uInX3FOWg245R1hM9w73W+S7AfH1WlDT
         5rt09qSmhRuPxP/V0/Z4auO6OHP0LW6dUaVHVviGef3pkYQK/CZTpfZz3b1JcVGTZdKV
         7IiB6gY3ntLKc+inE0gsWmPVNienW+m2sNBG+xCSSu3hi/MJxnKdqZBWpMBw6/yXOFzp
         oNrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oN+sLPJRs7U6ubaCblfaryc964dsGbRviBowu4xGE9o=;
        fh=aB/gG4ds7pbboMY7DKw3jLz1ZSMS/NiakTWSsUWnAOI=;
        b=IMWST8gYNM4YcjDo0bRkmC4Z26xtk1CpdrqnERxf89mOvKrnyNx9hsj7PqzmcC495z
         XGCSb3emYJlXTZ3T0l6es2AYy4Zqo05GoVylJ3yZqp9S6h4ggtbXQ0Zo7gT2cxw12igP
         zPkXaFz4777JbpvpMNWKzlbEtzZsGXgqtvwk1rwglfcz4FJ2HNIVzFZcnjvSbgM0Xgx1
         Er7FcEqYVMFOOQo5sVH2QPj5qD5Fhf8I1yfRhWUjG31bCqqm7wXuHpED/r3Q2B6C+0Dp
         NaYtBxvpRQJA7sm42SItN0hbeAOYNs1QOxm0ZuXaYQOlubGwAKgTgvufYp3YOQY7XsNp
         H/jg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1785573367; x=1786178167; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oN+sLPJRs7U6ubaCblfaryc964dsGbRviBowu4xGE9o=;
        b=stg8sz9gQFLuxI5ylp8u3R7Jlz6HB+rQ6Ob5ZXaxwFXeOhWEwx9ALw+smmPmGyeAPa
         D5BZ0K2GY0ZQv7S8Yjbo0DnO9UzXNaKp3aPwiE5O4/HyAORh6hadP6fyZ9UNXRUtr3GN
         egfDT8mUPcM2fyOlw0nGosiK6tpX4iINT1h7w/ygUR07Zx/g7dqJXTUOACD+9RnsTa0y
         e9NAQ1grMAdRg4ZqSxlGIhPJpt4o3WRnXO6Wuygl11XRlh7rNX309OxBX0PeG+0wAlky
         CTdZA1b/n/MGh8iH1nHmCxoRVJxvAsoApfGvX63u1OTi/Zp/IhTiSowZyqhoQsdIV5cd
         Vmug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785573367; x=1786178167;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oN+sLPJRs7U6ubaCblfaryc964dsGbRviBowu4xGE9o=;
        b=Hb6AhVfGmhPVLClnZpz7JmfqdinHWE0J/kX4wSv0OgFuqznuFXwSwRQPkEygXtQfIW
         BkHWlXGRaZX44dFTwF7z8OuYHV8o3ZVuVCHf1PXm6eRYq6b5TDfOyTTn+zhdT3NwrOuC
         pcTddUTGDMFJGqUdacvVXL6gW4cSXgl/ISyPj4mH6geb/v3CJCMyfjReyNkFLPeabXmu
         35dexTGal2gpZsr3YoXlcieS6LeHxpiykduU6/agQDbGiP8/FGteCzrMLCUeH2lS9Jh1
         uYs2RDKg7/Vag5jmD4Y1IAlLlyDrqYw/Mv89LqO4VkUxe1+GSm3kICfllRWkq/VRsaPn
         sl0A==
X-Forwarded-Encrypted: i=1; AHgh+RqEcU1CYkO3VfepNFaUxfmKAqgVywOMkTx0PZWHK+DYcCSYW5keW6TUFEr6urpUASg+WhnQzd0NZbs=@lists.infradead.org
X-Gm-Message-State: AOJu0YzRJWpy/RGjNKr2vuWme9OcFX+zBtH5hTbXkXZ/MoKmrIs4pUxy
	2sE9hmNs+VR+bCS1VPbRgqHuQl2pDzTJ6azDFp0UfWUw0JNmxIz/zapLO1dt/OZjJO2TH8mP9/d
	bcRpB37k9VwrTykPOozGD6B/99nkm7gqHgLO1t776XYUopJPeenLs2jM=
X-Gm-Gg: AR+sD108jyhH7X04WXOiTjmQGlbw6zH7a3bccozher88RIODyElzKsUc99cRVoDMl95
	BybX6/paqH0zL/3c+VT5IHXUq5InlkCM0kDIujOP9nasiJ/djnDLj/5DIwakxSsrvRjkhymXpBI
	kRkNb5uwjiEZyOwd69ntsns3yURjDr5urKRoGOdypeNnfMiqqo21qr8ip63feVIsJBtuYorCf8j
	+pgmHzUlpAEkKbEb2okM/6nhS30uhfPjMwrebp5am5qxjAZAhV1RttGQNq+ERM4QFSDczl0QO0c
	1ZZYusl9BOV4Kxj6KlDOaNPIgWYVx4ViI02sZb/hF8uqyBAeC2zM6aIKxHzFTT2vh109aEqxtw/
	xtySxId+m69ulYxiffnG9S3QR0q/qA5xsLUq4p6vZtuXKpKeZ2zkjYUXX8CfkfrVX
X-Received: by 2002:a05:6512:6889:20b0:5ae:b764:3ba5 with SMTP id
 2adb3069b0e04-5b2e4f9c50amr288278e87.64.1785573366525; Sat, 01 Aug 2026
 01:36:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260731093833.1551341-1-wang.yechao255@zte.com.cn>
In-Reply-To: <20260731093833.1551341-1-wang.yechao255@zte.com.cn>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 1 Aug 2026 14:05:52 +0530
X-Gm-Features: AUfX_mxBMP70jLpvU1dCTqR-waeQ9HTBiOZcnjCyTgyRTSVEjpFRKArAdatF0Gk
Message-ID: <CAAhSdy17xH1D7RpGnqJubqax_hTQaKpRu5g0tSDd2U6Rx71V9g@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] RISC-V: KVM: Optimize hfence request handling for
 SMP guests
To: Wang Yechao <wang.yechao255@zte.com.cn>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_013608_800335_D71B037E 
X-CRM114-Status: GOOD (  15.76  )
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

T24gRnJpLCBKdWwgMzEsIDIwMjYgYXQgMzoxMeKAr1BNIFdhbmcgWWVjaGFvIDx3YW5nLnllY2hh
bzI1NUB6dGUuY29tLmNuPiB3cm90ZToKPgo+IFRoaXMgc2VyaWVzIGltcHJvdmVzIHRoZSBoZmVu
Y2UgcmVxdWVzdCBoYW5kbGluZyBpbiBSSVNDLVYgS1ZNLAo+IHRhcmdldGluZyBzY2VuYXJpb3Mg
d2hlcmUgbXVsdGlwbGUgVkNQVXMgYXJlIHJ1bm5pbmcgYW4gU01QIGd1ZXN0Lgo+Cj4gVGhlIGZp
cnN0IHBhdGNoIEludHJvZHVjZSBtYWtlX3hmZW5jZV9yZXF1ZXN0X25vZGF0YSBmb3IgRkVOQ0Uu
SQo+IHJlcXVlc3RzIGFuZCBtb3ZlcyB0aGUgaGZlbmNlIGRhdGEvdHlwZSB2YWxpZGF0aW9uIG91
dCBvZiB0aGUKPiBWQ1BVIGxvb3AgdG8gYXZvaWQgcmVkdW5kYW50IGNoZWNrcyBvbiBldmVyeSBp
dGVyYXRpb24uCj4KPiBUaGUgc2Vjb25kIHBhdGNoIGZpeGVzIGEgbW9yZSBzdWJ0bGUgcGVyZm9y
bWFuY2UgaXNzdWU6IHdoZW4gb25lCj4gVkNQVSdzIGhmZW5jZSBxdWV1ZSBiZWNvbWVzIGZ1bGwg
YW5kIHRyaWdnZXJzIGEgZmFsbGJhY2ssIHRoZQo+IGN1cnJlbnQgY29kZSBhcHBsaWVzIHRoZSBm
YWxsYmFjayB0byBhbGwgVkNQVXMgaW5kaXNjcmltaW5hdGVseS4KPiBUaGlzIHVubmVjZXNzYXJp
bHkgZGVncmFkZXMgaGVhbHRoeSBWQ1BVcyBhbmQgY2FuIGNhdXNlIHRoZWlyCj4gcXVldWVzIHRv
IGZpbGwgdXAgcHJlbWF0dXJlbHkgZHVlIHRvIGxhY2sgb2YgcHJvY2Vzc2luZyBpdC4KPgo+IFdp
dGggdGhlc2UgY2hhbmdlcywgZmFsbGJhY2sgaXMgYXBwbGllZCBvbmx5IHRvIHRoZSBWQ1BVcyB0
aGF0Cj4gYWN0dWFsbHkgbmVlZCBpdCwgcHJlc2VydmluZyB0aGUgZWZmaWNpZW5jeSBvZiB0aGUg
bm9ybWFsIHBhdGgKPiBmb3Igb3RoZXJzLgo+Cj4gQ2hhbmdlcyBpbiB2MzoKPiAgLSBSZS1vcmRl
ciB0aGUgUEFUQ0gxIGFuZCBQQVRDSDIsIGxldCB0aGUgZml4IFBBVENIIGFzIGZpcnN0IHBhdGNo
Lgo+ICAtIExpbmsgdG8gdjI6Cj4gIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2t2bS1yaXNjdi8y
MDI2MDcwNzEyNTAzNC40MTY1MjEtMS13YW5nLnllY2hhbzI1NUB6dGUuY29tLmNuLwo+Cj4gQ2hh
bmdlcyBpbiB2MjoKPiAgLSBGaXggdGhlIHBhdGNoMDEgYnJva2VuIHRoZSBLVk1fUkVRX0ZFTkNF
X0kgcmVxdWVzdChTYXNoaWtvIEFJIHJldmlldykuCj4KPiAgLSBMaW5rIHRvIHYxOgo+ICBodHRw
czovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDI2MDcwNzExMzcxNS40MTMyNjUtMS13
YW5nLnllY2hhbzI1NUB6dGUuY29tLmNuLwo+Cj4gV2FuZyBZZWNoYW8gKDIpOgo+ICAgUklTQy1W
OiBLVk06IFNlcGFyYXRlIHJlcSBhbmQgZmFsbGJhY2tfcmVxIG1hc2tzIGluCj4gICAgIG1ha2Vf
eGZlbmNlX3JlcXVlc3QKPiAgIFJJU0MtVjogS1ZNOiBJbnRyb2R1Y2UgbWFrZV94ZmVuY2VfcmVx
dWVzdF9ub2RhdGEgZm9yIEZFTkNFLkkgcmVxdWVzdHMKPgo+ICBhcmNoL3Jpc2N2L2t2bS90bGIu
YyB8IDQ2ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAzNSBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkKPgo+IC0tCj4g
Mi4zOS4zCj4KClF1ZXVlZCB0aGlzIHNlcmllcyBmb3IgTGludXgtNy4zCgpUaGFua3MsCkFudXAK
Ci0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
