Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC861C28B30
	for <kvm-riscv@archiver.kernel.org>; Thu, 20 Mar 2025 16:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IdyMtXU6nQquL63KceAKJnH1BaK/qHwxOkdrMXX2EIM=; b=FvHaf0JQ7aN2pm
	PHZCKu4Rae8PdsRR0TSR1eIY7/IDNy93a3ed4Bmp6MjW7NoTd3sZ5wWZ3COB4/F2rDxqj/rGZLCpd
	1U+QfcAVPzn/8U2ztC5BXUDVIQ5IACsEf1MLj6F42DpQoF3Ub3dRmQmSgXBrAODq/qh3eXXat0vpe
	ewBHjjkZDPYHRuiMLZiJVPxG5WbIzukLIosR6azfHtdqS+hKt+XRMjdr6sy4o9G/rrVryOXTKGHHL
	R5Go08S7cNvs8b47YQkRnEUE5jTFl2Ms4nkuBr2kNXXhLWHmveujRMCU06zBiodCC0KtR/zbLKYr1
	WB/gBEvIN6QBq8bS2/bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvJ9y-0000000Cjct-1tav;
	Thu, 20 Mar 2025 16:54:22 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvJ9w-0000000Cjc7-1C8V
	for kvm-riscv@lists.infradead.org;
	Thu, 20 Mar 2025 16:54:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742489657;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qzs7lXSCEOdVamoYUmTO0qwA7wo38Km/t3XnMT38O6g=;
	b=Ee0tncQ3C6nwDMRQriZRi2iqJCA33agwS2+uS260H3p2vFpQbJ/kPVke0sboe08yRBXQnN
	GyteMCa47VFzo64NbgIG9sH9a/KvWSTXEgLIhxPQqsw3JvNGkStWvWVXXiiqVMLTylMPkw
	pfZ9yjmaIVtwmUVgtKrI5Rr8ojhgigM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-428-gxuh3KW_PYKVa9YkynOjbw-1; Thu, 20 Mar 2025 12:54:16 -0400
X-MC-Unique: gxuh3KW_PYKVa9YkynOjbw-1
X-Mimecast-MFC-AGG-ID: gxuh3KW_PYKVa9YkynOjbw_1742489655
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-39130f02631so452304f8f.2
        for <kvm-riscv@lists.infradead.org>; Thu, 20 Mar 2025 09:54:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742489655; x=1743094455;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qzs7lXSCEOdVamoYUmTO0qwA7wo38Km/t3XnMT38O6g=;
        b=m6XhFiZA3s+GNrj2oMVCppSW5IugzHqsrJmODOi7Xw2+uWMmNUQgASmX1hietuO2MX
         flHT5JwmgDAhRABnS7KAZkAJ58kUjn7WOvgxZC04Z4g+QbXcCBjBSi78Ebsb56vd2bDv
         0o+msHoh25CEDTbaflkkn1HmYhiRkRw+i+JnwiKUxEi7iURAYFpdfOEcp1D+I60AqnvU
         IxA2XMhzA+aLOk1OyaPsBREbbYqE53rBYy1MexHIBvt6DORZlyVUzsz0Ut4a06tyXIEb
         2eO0PgNsDNDmazx77D+oH2HyvHlvRhSO37Cwp0ZqcCw2HkdpRffUQZ07khTt+7zbeTxg
         CcNw==
X-Forwarded-Encrypted: i=1; AJvYcCUFn2052dv8KAG2XPXTmeGtCPCFzJNMEQyKxaOqq6Cswvf9/0aZzLz0BmBtrP0AVyczN0SGUKuhHOo=@lists.infradead.org
X-Gm-Message-State: AOJu0YyVTmU86ieJOoWUpVLOa0V6xblDuDFGj8voOYTWz9kQ/G02Sdfd
	3rFpQn9+tB1wX23j48+6JKMRxfJFR5R85a1a1mbeW7wszIOuk0RjLb+gIBeiJ1NDulxsUzkA3eu
	FJOW9Othvuqg2v2b6f6jnm3Bw3bZ+R7X8gcH76cQdBbu4y6kM0w52KCErkFY40YWAvHCXnhfuP4
	dMKZBeBF2VX4KhIPp16ju+qM2dNmxY3LLviWTvWg==
X-Gm-Gg: ASbGncufCO17Kmru+FCXCkkJOZnTRIFvnyE+F/R0e/WaOPz7gunLkKDz3drHiOj+QY8
	wxB1H9ID8muGvhUdM4OioqoY3Ugwi3dLOI5JO/XWQm4cDCjxKWn9oxRIdFeTiy/9TJGwMGK9UWw
	==
X-Received: by 2002:a05:6000:4188:b0:391:4999:776c with SMTP id ffacd0b85a97d-3997f932c74mr219918f8f.40.1742489654947;
        Thu, 20 Mar 2025 09:54:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFj9pl7GARtWFq3jbXWirX8oR8zmkq+Vb5cM05rQzCwUuLwhvW30WXCS+Nl/XDDl7rMvPzTyG7iVBUS8ETq7S4=
X-Received: by 2002:a05:6000:4188:b0:391:4999:776c with SMTP id
 ffacd0b85a97d-3997f932c74mr219900f8f.40.1742489654526; Thu, 20 Mar 2025
 09:54:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhSdy380StEE03G=RPjKoxtY89nLeufpXbjYwbRypzzrkQN+g@mail.gmail.com>
In-Reply-To: <CAAhSdy380StEE03G=RPjKoxtY89nLeufpXbjYwbRypzzrkQN+g@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 20 Mar 2025 17:54:01 +0100
X-Gm-Features: AQ5f1Jp_WB0jgmaoJDDes32ApEWmT6Y0Q3VLmJo-2VN8hWbZcGCzV2rcn3utTOA
Message-ID: <CABgObfYbgLN6aqDYTXq=t2G5+KsHjUmdFFCuwmzdEZSVDTrOxA@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/riscv changes for 6.15
To: Anup Patel <anup@brainfault.org>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>, 
	Atish Patra <atishp@atishpatra.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, KVM General <kvm@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -13eeuMYvC7HK5X0GZD4uFLTVvGQ8zr1P-9rdNbJ6CI_1742489655
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_095420_389866_A0B8A2B4 
X-CRM114-Status: UNSURE (   6.58  )
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

T24gVGh1LCBNYXIgMjAsIDIwMjUgYXQgMzoxNeKAr1BNIEFudXAgUGF0ZWwgPGFudXBAYnJhaW5m
YXVsdC5vcmc+IHdyb3RlOgo+Cj4gSGkgUGFvbG8sCj4KPiBXZSBtYWlubHkgaGF2ZSB0d28gZml4
ZXMgYW5kIGZldyBQTVUgc2VsZnRlc3RzIGltcHJvdmVtZW50cwo+IGZvciA2LjE1LiBUaGVyZSBh
cmUgcXVpdGUgYSBmZXcgaW4tZmxpZ2h0IHBhdGNoZXMgZGVwZW5kZW50IG9uCj4gU0JJIHYzLjAg
c3BlY2lmaWNhdGlvbiB3aGljaCB3aWxsIGZyZWV6ZSBzb29uLgo+Cj4gUGxlYXNlIHB1bGwuCgpQ
dWxsZWQsIHRoYW5rcy4KClBhb2xvCgo+IFJlZ2FyZHMsCj4gQW51cAoKCi0tIAprdm0tcmlzY3Yg
bWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
