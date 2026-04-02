Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E052D6AAE5
	for <kvm-riscv@archiver.kernel.org>; Thu,  2 Apr 2026 16:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a8SFNIYzEcJZE7rQPq5dGLv1PguLeMYz/dOC85YyRrI=; b=YwSc+uOgAkl8sK
	Regh12do4ijQNgYV4JFWC65E6SoP/4bFvAcX5rm93j3MguUkl6hPa6jRvHFfz5qG+x0UMVFcQd0yQ
	1QpMONgFckyw7Rcd4jfhneZ9DgHGp7lIA3+GwiVvv9cSDHUpoyK25TBIZFExTr3yIwlCLty3RSprV
	r4nfuAJQdXRJvA3POcW76ixKx3Gc/csZdt8Krbo7u0UVYZzv/8DEs9r2NkUDLg5KMaiyeb2dT2lzU
	ko7lGl/Imv47sNsg2JXBsSfIm122KBDNnKJyPJmkFwI23gVSK8O0OLZ14itfSQbuPdI+2eBMMXdwt
	1hd0dWrubdCcaj6s3w6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8KTB-00000000TyR-3R2A;
	Thu, 02 Apr 2026 16:00:33 +0000
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8KT6-00000000TxE-3Aee
	for kvm-riscv@lists.infradead.org;
	Thu, 02 Apr 2026 16:00:32 +0000
Received: by mail-oo1-xc34.google.com with SMTP id 006d021491bc7-67bad873c3eso595428eaf.3
        for <kvm-riscv@lists.infradead.org>; Thu, 02 Apr 2026 09:00:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775145627; cv=none;
        d=google.com; s=arc-20240605;
        b=ODZwrU+vDAqQ6zdyJYH8evcl1sJSytpZkTTgWpMKJMskfwFwNFn438ViX1cQWZCkZP
         vZ4LmvJcD8BF6cwcVxb+OAQbErtDlyQWyvJ67QiNZVQOR9/Px9mZDsAFnAApe9ZSMkxj
         NLXUV5khehJx9BP5nddbW38gDhvsI/wiJIugoar3sgC0Pw7+FcqyuYM1efaAuDsU9evn
         k6fSw5dNGwN9h5fFt8GM9Hsy+sjkujE68eA+zN3uPuzFDXRZrhJ2Y01T5RsN6ifAeMrK
         RNJRKAeNism8+i0S+hTm2eiutnwIVyLyTva0qXPJ2vjqZz+2r6VmOLs0Qd8sJoFeTU3i
         WdAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WtM2gelQtlkDLtUyeOY/RQAEzxS8kBtRhg00qUrjMDQ=;
        fh=L2oYi+huwTT3UW0kRZHx+PQqhfFAGHdmuw/ykHo5Jwk=;
        b=dNDenFz6jE18xztB7IzEXPTYC9CLO9hSMWdObpN3RXvypESyImXkDNKos2wVW81NHF
         yS4UdXBVIqN+mz4nQYOiONbCqpdM1t64WbGxTvfdftMZ05Isa8RIufeT43tUxGNYSHfW
         7sN5aZudJLfnS8MwWavh55iA1xIqA4ZkIENJ4O2DD2bNqxWGdoMGOrvBeeJCVxCdOZoC
         /EjJQx/eD6tnuRoYHOZ7YfFcLWLz7x1EArMF1BLV1VUfh3O/OOIEWUOWale0kruIOUNR
         sQ3ny1MdYp9+gLmr5Rhivjdze8tTdWnkVuBvWgFdL+7/UEPY454BnfiJAYVycfPxu6wy
         11rA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1775145627; x=1775750427; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WtM2gelQtlkDLtUyeOY/RQAEzxS8kBtRhg00qUrjMDQ=;
        b=XTHncYozAkL9Yl5OSyeJw2+3v2CFJzVvmWn8caMEn1hHRNfDKiGlc1zRpAvK9oWE4L
         eqmkD7O8mZoYZUk05uONIfTQAAA7hS2NC7CQNPQakL54wC+C0JY3u7oOn5lK+C5DQTZV
         TzX9AplE66LGE+OQA2P9UugD27WEik+1A5HCSTcPn0YciwoLJOnZzYm7jxVaM1uUvMq+
         njHmfqA627Q/6Cw6Gk6IEQ0H8nB900FD/AAgBJPCpVGd9R6mBlB4irsSgthL2GVKIk3n
         t0qIdhVaQ7M+QGxe/7jOxdtJoaJNi7IYaMU84+3URQK3TjP3pQ5P76SjEwhRKFmM9UR+
         /79Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775145627; x=1775750427;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WtM2gelQtlkDLtUyeOY/RQAEzxS8kBtRhg00qUrjMDQ=;
        b=Zhc7vpBiif6AcrqRAkAn9I2MxDEA8dZW4hjFug1SQfUIMs3WdZIkM6SL9O5l4k8WbI
         agNfWe8FRsGVkwDiS5S47h2JYiA6IaYv+ZnTSr2M7VsbraPxbQbiet9pYykDeMw8V4gX
         7fFEMscyxSz6M+rs5F8OQmKbfJdW18tql8ZVhvW54PSkbbtUI29fF5esFatZ4++yzSuZ
         NYa21bMJMoL2No422EShPF1khAPnPHBPuCgRVf60bXmoIi/2GS5VKcYhlIyGvAisyyXo
         HJyXQDrvzai9WskD29q6L9xgNNj/62OR8wSwMW7zrprzFD49+sZv6tELV09ZWtmpSeMs
         8tMw==
X-Forwarded-Encrypted: i=1; AJvYcCXdo0St4kZsQUM4Lrh1rJ83rYLS3U5UNtWjncNfpd7q02Xd5s4c3rsJB4L8ue/UEvm1cTL3DGhPDz8=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6a+5HeDIOACZ4Ez45u1wC7LqSQXEqi/Tj7nzvEM0TbU5UO4bb
	kuU8TMojdSwJLYX8En2L8QdCyspp1V6ylgFcDs1zXAnc4/LYzr+nJ97vfpOCWsST441aRSipIW/
	Iq42eQSmHk7iuWk1UrawjZwzYXS4Am/lHuC6iDhE8IA==
X-Gm-Gg: ATEYQzzLy0l60Z8LMPl8l9ZP4yjrkCQ7ktIh4P+tc9hfCRhhxnZ9nldcb2Yt4ni1x64
	wHFROKU8ACiQ6JJbLf1zjIt/Z8Kq8t8uu7mOGpp3yE3sAC0aP3HAYrOL3ny+nMqoTLFU+AxyV7x
	Q3Y9USH81M/WEnAL42fdhZ0kC5vW3X//swkIUcJk7buz2Dl6j96jzMSMTJB36h45j/DsnJemYz+
	574Kj5kLQkjXafuLMjYNYz4VdpJY+mH2NHaGubIW3scVsWVo41uzwY2D9R8T0BZpYdl8Da9Hl5e
	yFCAIANsPzxSLI/zIr//ak4Q+PmrHK2t2qKUTicYavgk6mUHg2WrexGZdQi243EamL2hpAfz9NG
	oH1UGUlmns77nunOS4TEXFsfH5Q==
X-Received: by 2002:a05:6820:1992:b0:67e:16b4:aa07 with SMTP id
 006d021491bc7-67fabd02b7emr4353699eaf.61.1775145627522; Thu, 02 Apr 2026
 09:00:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260402101818.2982071-1-mayuresh.chitale@oss.qualcomm.com>
In-Reply-To: <20260402101818.2982071-1-mayuresh.chitale@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 2 Apr 2026 21:30:15 +0530
X-Gm-Features: AQROBzAd1C5PJZt0gGUQZy-ZILEi3rG_cTSfqG4yBNpRYZjiqBUpj0qc4P6OGJA
Message-ID: <CAAhSdy0FP=-KQV_QaMVWJz9gwEzm2BdVH857MWx28Jej+S+vMw@mail.gmail.com>
Subject: Re: [PATCH] KVM: riscv: selftests: Implement kvm_arch_has_default_irqchip
To: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_090029_048681_3D0A6090 
X-CRM114-Status: GOOD (  13.06  )
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

T24gVGh1LCBBcHIgMiwgMjAyNiBhdCAzOjUz4oCvUE0gTWF5dXJlc2ggQ2hpdGFsZQo8bWF5dXJl
c2guY2hpdGFsZUBvc3MucXVhbGNvbW0uY29tPiB3cm90ZToKPgo+IGt2bV9hcmNoX2hhc19kZWZh
dWx0X2lycWNoaXAgaXMgcmVxdWlyZWQgZm9yIGlycWZkX3Rlc3QgYW5kIHJldHVybnMKPiB0cnVl
IGlmIGFuIGluLWtlcm5lbCBpbnRlcnJ1cHQgY29udHJvbGxlciBpcyBzdXBwb3J0ZWQuCj4KPiBG
aXhlczogYTEzMzA1MjY2NmJlZCAoIktWTTogc2VsZnRlc3RzOiBGaXggaXJxZmRfdGVzdCBmb3Ig
bm9uLXg4NiBhcmNoaXRlY3R1cmVzIikKPiBTaWduZWQtb2ZmLWJ5OiBNYXl1cmVzaCBDaGl0YWxl
IDxtYXl1cmVzaC5jaGl0YWxlQG9zcy5xdWFsY29tbS5jb20+CgpMR1RNLgoKUmV2aWV3ZWQtYnk6
IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpUaGFua3MsCkFudXAKCj4gLS0tCj4g
IHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9saWIvcmlzY3YvcHJvY2Vzc29yLmMgfCA1ICsr
KysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS90
b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vbGliL3Jpc2N2L3Byb2Nlc3Nvci5jIGIvdG9vbHMv
dGVzdGluZy9zZWxmdGVzdHMva3ZtL2xpYi9yaXNjdi9wcm9jZXNzb3IuYwo+IGluZGV4IDUxZGQ0
NTVmZjUyYy4uMDY3YzZiMmMxNWIwIDEwMDY0NAo+IC0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRl
c3RzL2t2bS9saWIvcmlzY3YvcHJvY2Vzc29yLmMKPiArKysgYi90b29scy90ZXN0aW5nL3NlbGZ0
ZXN0cy9rdm0vbGliL3Jpc2N2L3Byb2Nlc3Nvci5jCj4gQEAgLTU2NiwzICs1NjYsOCBAQCB1bnNp
Z25lZCBsb25nIHJpc2N2NjRfZ2V0X3NhdHBfbW9kZSh2b2lkKQo+Cj4gICAgICAgICByZXR1cm4g
dmFsOwo+ICB9Cj4gKwo+ICtib29sIGt2bV9hcmNoX2hhc19kZWZhdWx0X2lycWNoaXAodm9pZCkK
PiArewo+ICsgICAgICAgcmV0dXJuIGt2bV9jaGVja19jYXAoS1ZNX0NBUF9JUlFDSElQKTsKPiAr
fQo+IC0tCj4gMi40My4wCj4KCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8va3ZtLXJpc2N2Cg==
