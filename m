Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD114F53D6E
	for <kvm-riscv@archiver.kernel.org>; Mon, 16 Mar 2026 16:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AnSw7C/MavxIIimnWTY4M3R849PNxeQBnAaMlO4L1zo=; b=auiSOrThlbRwl9
	37/E4Zq2DZMvaLovNe6+qs63/n02VGmNZsFdD/wu/jBjp1NeEWxrCBkd5HyKvFNxO36v78ZnSNtGz
	I+v6I8aT1NlwVaPTObnR7uiHrSECL0PyXfWB0oLkvwzCxY+jDPZTb8wjBPeAxYLSLVeh5EuR2tOB3
	Fa4p3MTrmhpyb8FRCbtXbpQExA0PV0YegJf1arRKru88Ve5pIZ+i548jmWjxBkHlvM6MeXsLN7dzx
	l5NqM5GrOSNkfWXvc1vOd4tgrGxP9PhLW4dX0Rim/c5XvxF2FCc1YCtl0EilV10vGI3brX5gj+P7n
	2fvNMCYL5D4q6sjfouPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2AwU-00000004TFj-2XJp;
	Mon, 16 Mar 2026 16:37:22 +0000
Received: from mout.web.de ([212.227.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2AwS-00000004TFI-0iJx;
	Mon, 16 Mar 2026 16:37:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1773679016; x=1774283816; i=markus.elfring@web.de;
	bh=YMAIPxjG8g4qU2u6NbxETXet6+DAyt53Q6K9A3CX5q8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=JVF3Vx8gD8zrCtydGtWeboXYI2Qz2FRXRhH8pacxVvpUaT8r5PDZtfwA220c3zaT
	 XjeJvOEvl21Py2ICB6uQiySKh3jv+bvITc2OHjAvZ8GVYcJIEikBkuTL6yIbNm8XE
	 ek3pLmSSppJwUCJ67ctV1I5BuqM8Vo7HTz30ADtz6AWJI73WcVEtHp80BAZcwsIHt
	 bm0Y6ZTPHrs9mGzjRQl5ag4I9jeTcTqUPy4S1Owd6U0rQGaCmOH2gnHOKRQMCL6em
	 nToOZnnEcuK3MKyUsVlLFSjhW5JQbQrNd9Dlbykm2TfR3xDm0yqT8JjMAe2CN07M/
	 rmeZCf/IhmQm7MFKAQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MKuKF-1wJ1vh2lVV-00QJaI; Mon, 16
 Mar 2026 17:36:56 +0100
Message-ID: <9b504811-0998-4879-8ab9-bbcaa423555f@web.de>
Date: Mon, 16 Mar 2026 17:36:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: riscv: kvm: fix vector context allocation leak
To: Osama Abdelkader <osama.abdelkader@gmail.com>,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 kvm@vger.kernel.org
Cc: Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>
References: <20260314223144.154349-1-osama.abdelkader@gmail.com>
 <19cdcafd-adab-469d-9729-f01e8bcaf543@web.de> <abggnCAb9Py60PBT@osama>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <abggnCAb9Py60PBT@osama>
X-Provags-ID: V03:K1:4dsqmlkQmVhcN1C6ZRMNRWv42XM2cBsSXGDc/5Ne4+zYSrVBD7l
 +ROVxErVG8h4OvYw5EOPDjsj1vFJ8t4LvHF60jj+bFYkANjqloUU05OBBNXj7Uavh30Zp6M
 ydg00WP7EYgPRtAYIOpSDK+rHkEa6B4pVPItAEBLtFWOXZcK0wKxE1os53kAcC9hZzq9WIr
 6zY86R3k/Ya9Sd0BTY7Gw==
UI-OutboundReport: notjunk:1;M01:P0:nLGqwlVCaiw=;Y623OH/x8WSOklSYr26Rar6dIPe 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 0obgauK7PJVAI/pRtl5xrmfmC9wnz
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_093720_519587_31CB7D09 
X-CRM114-Status: UNSURE (   3.66  )
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

Pj4+IFdoZW4gdGhlIHNlY29uZCBremFsbG9jIChob3N0X2NvbnRleHQudmVjdG9yLmRhdGFwKSBm
YWlscyBpbgo+Pj4ga3ZtX3Jpc2N2X3ZjcHVfYWxsb2NfdmVjdG9yX2NvbnRleHQsIHRoZSBmaXJz
dCBhbGxvY2F0aW9uCj4+PiAoZ3Vlc3RfY29udGV4dC52ZWN0b3IuZGF0YXApIGlzIGxlYWtlZC4g
RnJlZSBpdCBiZWZvcmUgcmV0dXJuaW5nLgo+PiBXZXJlIGFueSBzb3VyY2UgY29kZSBhbmFseXNp
cyB0b29scyBpbnZvbHZlZCBoZXJlPwo+Pgo+IE5vLCB0aGVyZSB3ZXJlIGZvdW5kIGR1cmluZyBt
YW51YWwgcmV2aWV3LgoKV291bGQgYmUgbG9va2luZyBmb3IgdGhlIHN1cHBvcnQgb2YgYWR2YW5j
ZWQgYXBwcm9hY2hlcwp3aGljaCB3b3VsZCBtYWtlIHN1Y2ggYSDigJxpbnNwZWN0aW9u4oCdIG1v
cmUgY29udmVuaWVudD8KClJlZ2FyZHMsCk1hcmt1cwoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxp
c3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
