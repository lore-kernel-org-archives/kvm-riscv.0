Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3427A10F284B
	for <kvm-riscv@archiver.kernel.org>; Fri, 27 Mar 2026 16:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NxrEdJJLlZ1s0KAgR1cXdz4HB1pQ47ilpVhaGTx/N7Q=; b=cHgRpm6iQNZk0f
	TUa0eNy5r+2xVjJaSenug/oiHTLHMf3fr9I0ohrw7ARd2gC7Qi/blCzcyVyavuTo4xFMeP6/Q+o6y
	o48zhSEltrapx7m1e4vEAVLb9oF/35AEkS5Y4q0me0AtgBKr5PeBgDpQiQMTyl8LlbrTLf0yVa3IQ
	PbrvJOjyCXXc1Tzvv5VWWczl8jTxFHQ6jn3Ko+lFjCk60FXlTNQve71mEIjQY19dbxir5vCCv0v8P
	CA4gckJlk6m7BmTsXw5Lde4m2zvaQGQVhp6juAa0tPZ2+TMK08AHF5eUIJFEOLnRGDfC1fJVuRS+k
	/nMvDUL5XemCM3sEjRxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w69yU-00000007lkH-23Zv;
	Fri, 27 Mar 2026 16:23:54 +0000
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w69yS-00000007lj9-0PVY
	for kvm-riscv@lists.infradead.org;
	Fri, 27 Mar 2026 16:23:53 +0000
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-7d744d9acbeso934104a34.1
        for <kvm-riscv@lists.infradead.org>; Fri, 27 Mar 2026 09:23:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774628631; cv=none;
        d=google.com; s=arc-20240605;
        b=Z2fuNFuR5Jqmjlmn06gkvrTGp5N1fh/Tq2jUWplWAzc80TN+H7texp0+bAcEo3Kb+Z
         SxUWHleDtg9p0xmS4QybXtfUqtXYLYvCBctY3+I2LtP80Sw6s8H0wO9Pbr2PtF7WTpd7
         R3qaE4UfI6dUBfKo3OZ9iATUk1sZsBk+s52ltTs3q1Ho0dncncceDJy+O9gIoh9OPODd
         KblzSZ+rR3A0+RA/hdfHzm+cHhYty/jpirqmJp3o+Y+9lJDOEquaQKUVivUCxe6A6irs
         9y/2oj8jus8NCpdGgUiGRp313mvdZByNYFoVEXjKVbc0qH7y0gt7qhjlPg3Cf3ZNntLV
         S2CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5i7AMnECXeGliuvzkSngvQOxbDfImYVhWzHk0/VD+K8=;
        fh=GRuDNx1Fa5DjzzN4th2xZs6cXCB5MtJnPssGEko1VOs=;
        b=Yt9ry8qUgCl5cZ9RWPj/IBmac+7lteWGBgcYzRIl51fTZ9XO65B1XYIPELOwOfo5nF
         4Ah+TwsKyr2ZCUV8MF6hQpEsOU5TdcyHVZntfHR5pr4i8j7nQIT9CjAKgSnZgXtlnIpM
         7NzpqMm5TZf/5/Xi/jQxVznL2gekwohM8htpz4Nxod2WN4X5J8uyStKzVqBUx2645Aoj
         FuHMJ4EB4LiNMdL2xrJxt1KtjiKx07x9wA4obAIsaPbHI/Lpp7ga1dmpA6HPRevvY2I9
         /ljWZhR1jOHGYFOwYqpxdE/ubQNaTkjZ27xBYK+RM16t1OOcLf6Qkosduu17dkwrPpLS
         2LxQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1774628631; x=1775233431; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5i7AMnECXeGliuvzkSngvQOxbDfImYVhWzHk0/VD+K8=;
        b=BJQSrru7hiN88Ot+ITmPY7m61ICSyr9yKnt04fR81QcFb8jOMkRh+wvyupzW8iLR94
         c7GDEv1gYGSapS16NEz4O5plCyitIvwnxwSaOiOIUNNUCXMOSqfvqwOcPh5r08RWxLi3
         f85xlPJ6Gt05CRi4hZgVdqCUs8QqX802kQI9kvVvUy0a2X8uo+k+KahmGnWuFyWzsJeY
         itSUp85LHObLlhb2cyiM1bT1d5bOoE1ThwnGwOT26vNSl1EM/r7PpuaVkGiqlBYVmQ6h
         woS3T9CzPkbRkAlplb8MBNxQOO/T4j3h1Dk7T/45+a6o+/tp5bgteN6k7JyWzGwlH8/d
         u46w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774628631; x=1775233431;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5i7AMnECXeGliuvzkSngvQOxbDfImYVhWzHk0/VD+K8=;
        b=N6OGfslI4pVnUARkxzPEGDOSyTSTvjuVgppwPG1mhOqC8kJPe7CxPncmcxuaqi1JBC
         XkItnMWGCCc+TzXygsdbtfi1OxJsWbUYeJXL0PWpAeC2SkiXIQXohTxNmBX1u4cKWV9D
         BOCyO2Ut7XpVcx9AiWnfTUgZXHgt+P2oymgpLhr/MVRGYY9dzaaqUkLlqWGqmwv/nySs
         weNa9k3YbJE3sszjtP1/QvNFnOWyG+QEbhe35bmPpK2FQmB15Dg6xG1GSDG9J8k8pnni
         4N2GtvhO357GwWNMuGNJ0T+tdEEhu4CogpYwlJ2QRqrK2SkTOS/wf45CQORmDjNLfeXS
         rp+A==
X-Gm-Message-State: AOJu0Yx0Ccy/uQ3aOYh73BuCKWXl6FooIwn7u7dswzEd+Cl8mxK+ptOT
	YlYBPtXS/GncPDGyt6ugJt18DQ99MOaQsmm2STYoPD3Ds/Q+XclT7z1JnD8E6qEzR7qdpi1x6re
	EiaTdM0DS4FCXoQ61sGcHJHwstNbx3nbfpfuJ36tnVQ==
X-Gm-Gg: ATEYQzyqAC5uNJB3mOf1JH6qzCNkHkBvdvahVdQE3MBV33nkNDaYttxoH2pbwtcgZXZ
	dhojDN3xXL9NMLKVRBZK4a5TCj4vo0q7dm6oGrPsl0ARl58nCyilqleRSIJTVkXKtehbZIzS5t+
	uBupGiT9deERne5BRDNmxj1e9Y7WKDU5ASeE9h7eqKHq7SK4OPm1h8Sa57S2Doh2t4DIMufaZv4
	QE/UGZo5mp6ZJ1wV1YMCNMad1wGgVuvzyN/EX0jbYVGlqMrexV4eyqKTFP98fytvW4vRL58gQe7
	d3NJf8cwZcBv3mNeHQw3BCJCpm2VwzGjcHe7Q8RM/MoBzgFPsHl5xUm/5tG2UFeAC/4/kU2DmfC
	QiJBs66DsHv6dUEW0GQj8hVv4zGo=
X-Received: by 2002:a05:6820:2916:b0:67d:2cb:2079 with SMTP id
 006d021491bc7-67e1875bd34mr1529379eaf.58.1774628630795; Fri, 27 Mar 2026
 09:23:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260316014533.2312254-1-xujiakai2025@iscas.ac.cn>
In-Reply-To: <20260316014533.2312254-1-xujiakai2025@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 27 Mar 2026 21:53:38 +0530
X-Gm-Features: AQROBzA9STNkwcnpYQkGGVqwDqCIWR_7nCDRTW55e5KIm3IP1CNA2fjdu_Yz16A
Message-ID: <CAAhSdy0CeQOnLdsCqXVxZcP-mxMDqjSMhEnLVVYTr46jbj7iWQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] RISC-V: KVM: Fix array out-of-bounds in firmware
 counter reads
To: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Cc: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones <ajones@ventanamicro.com>, 
	Atish Patra <atish.patra@linux.dev>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Paul Walmsley <pjw@kernel.org>, Shuah Khan <shuah@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_092352_178264_2C12F18C 
X-CRM114-Status: GOOD (  15.16  )
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

T24gTW9uLCBNYXIgMTYsIDIwMjYgYXQgNzoxNeKAr0FNIEppYWthaSBYdSA8eHVqaWFrYWkyMDI1
QGlzY2FzLmFjLmNuPiB3cm90ZToKPgo+IFdoZW4gYSBndWVzdCByZWFkcyBhIGZpcm13YXJlIFBN
VSBjb3VudGVyIHZpYQo+IFNCSV9FWFRfUE1VX0NPVU5URVJfRldfUkVBRCBvciBTQklfRVhUX1BN
VV9DT1VOVEVSX0ZXX1JFQURfSEkgd2l0aG91dAo+IGZpcnN0IGNvbmZpZ3VyaW5nIGl0IHdpdGgg
U0JJX0VYVF9QTVVfQ09VTlRFUl9DRkdfTUFUQ0gsIHRoZSBjb3VudGVyJ3MKPiBldmVudF9pZHgg
cmVtYWlucyBTQklfUE1VX0VWRU5UX0lEWF9JTlZBTElEICgweEZGRkZGRkZGKS4KPgo+IGdldF9l
dmVudF9jb2RlKCkgZXh0cmFjdHMgdGhlIGxvd2VyIDE2IGJpdHMgZnJvbSBldmVudF9pZHgsIHlp
ZWxkaW5nCj4gMHhGRkZGLCB3aGljaCBpcyB0aGVuIHVzZWQgdG8gaW5kZXggaW50byBrdnBtdS0+
ZndfZXZlbnRbXS4gU2luY2UgdGhlCj4gZndfZXZlbnQgYXJyYXkgb25seSBjb250YWlucyBSSVND
Vl9LVk1fTUFYX0ZXX0NUUlMgZW50cmllcywgdGhpcyByZXN1bHRzCj4gaW4gYW4gb3V0LW9mLWJv
dW5kcyBhY2Nlc3MgdGhhdCBjYW4gYmUgZGV0ZWN0ZWQgYnkgVUJTQU4uCj4KPiBQYXRjaCAxIGZp
eGVzIHRoZSBpc3N1ZSBieSB2YWxpZGF0aW5nIHRoZSBmaXJtd2FyZSBldmVudCBjb2RlIGJlZm9y
ZQo+IGFjY2Vzc2luZyB0aGUgZndfZXZlbnQgYXJyYXkgYW5kIHJldHVybmluZyAtRUlOVkFMIGZv
ciBpbnZhbGlkIHZhbHVlcy4KPgo+IEFmdGVyIGZpeGluZyB0aGUga2VybmVsIGJlaGF2aW9yLCB0
aGUgZXhpc3RpbmcgS1ZNIHNlbGZ0ZXN0Cj4gKHNiaV9wbXVfdGVzdCkgZmFpbHMgYmVjYXVzZSBp
dCBhdHRlbXB0cyB0byByZWFkIGZpcm13YXJlIGNvdW50ZXJzCj4gd2l0aG91dCBjb25maWd1cmlu
ZyB0aGVtIGZpcnN0LiBQYXRjaCAyIHVwZGF0ZXMgdGhlIHNlbGZ0ZXN0IHRvCj4gY29uZmlndXJl
IGEgZmlybXdhcmUgZXZlbnQgYmVmb3JlIHJlYWRpbmcgdGhlIGNvdW50ZXIgYW5kIGFkZHMgYQo+
IG5lZ2F0aXZlIHRlc3QgdG8gZW5zdXJlIHRoYXQgcmVhZGluZyBhbiB1bmNvbmZpZ3VyZWQgZmly
bXdhcmUgY291bnRlcgo+IGZhaWxzIGdyYWNlZnVsbHkuCj4KPiBKaWFrYWkgWHUgKDIpOgo+ICAg
UklTQy1WOiBLVk06IEZpeCBhcnJheSBvdXQtb2YtYm91bmRzIGluIHBtdV9jdHJfcmVhZCgpIGFu
ZAo+ICAgICBwbXVfZndfY3RyX3JlYWRfaGkoKQo+ICAgUklTQy1WOiBLVk06IHNlbGZ0ZXN0czog
Rml4IGZpcm13YXJlIGNvdW50ZXIgcmVhZCBpbiBzYmlfcG11X3Rlc3QKPgo+ICBhcmNoL3Jpc2N2
L2t2bS92Y3B1X3BtdS5jICAgICAgICAgICAgICAgICAgICAgfCAxNCArKysrKysrCj4gIC4uLi90
ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vaW5jbHVkZS9yaXNjdi9zYmkuaCB8IDM3ICsrKysrKysrKysr
KysrKysrKysKPiAgLi4uL3NlbGZ0ZXN0cy9rdm0vcmlzY3Yvc2JpX3BtdV90ZXN0LmMgICAgICAg
IHwgMjAgKysrKysrKysrLQo+ICAzIGZpbGVzIGNoYW5nZWQsIDcwIGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKPgo+IC0tCj4gMi4zNC4xCj4KClF1ZXVlZCB0aGlzIHNlcmllcyBmb3IgTGlu
dXgtNy4xCgpUaGFua3MsCkFudXAKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8va3ZtLXJpc2N2Cg==
