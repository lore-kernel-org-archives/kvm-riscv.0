Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE2A5CD4851
	for <kvm-riscv@archiver.kernel.org>; Wed, 13 May 2026 12:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SYcQwrOH4sbbglChe5N7UyDj2IqhWrZv3gtqZI9VBBI=; b=AKf1eaHzeKFgAy
	deiRQvPhRPGpmX4gplB3dhzgNNBJXI5s1gHgdt30E/vUMfUVl/lmAH2zuSKFpbdlyDV4rdLONd+XI
	qvqrmvDGBH2bl9QksDbhps8dV3hYetxInG9gbRwcdvPdqpzZhFQ+IaA+uhv2uidegSd0A3/fKSxw5
	D7zP3bKS3Aj7d+zM0UhEWH0B0NbwvqX04kuOONjmKxGhQlr1eMzHIBug+XY8CATPHJ0akGn27YP8+
	imJyFeESM8MJRFLosP2NCZdDQlsuZ5TAdMb/6F30yT99ePTFhNN6gSAnlZ5WBfu7FiNDAoMaDTwJR
	9FfL9/kT10XTQOAmZVsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN8iZ-00000002UOj-1mcE;
	Wed, 13 May 2026 12:29:39 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN8iV-00000002ULb-3ovs;
	Wed, 13 May 2026 12:29:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=rki0N/LpUp9snFOn/spm1BVi6skoI5EoYdbrvY3VzsA=;
	b=QhTKJVHKC4yJSk2JANCGSgPcBKawo7jIM5dU9QNbsX6C0x5LcyI0TQ+6CCWKzi
	dE6n7uy/laAWFIAC4D+WaYZybda87AJsM0oVnZScdNjo5LQBHWa5QeSe0gRlDeEh
	qjCp7NlN11g7uIQswjYgZhNqOr5VK5zNqMO3a6F2vwQWU=
Received: from [IPV6:240e:38c:8516:b200:c068:c931:3eaf:6c76] (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wB30cdFbgRqe32jBA--.12714S2;
	Wed, 13 May 2026 20:27:50 +0800 (CST)
Message-ID: <f64029bf-1f4c-40a7-860a-eb04fbe5317b@163.com>
Date: Wed, 13 May 2026 20:27:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] KVM: selftests: Add unit to dirty_log_test
To: Sean Christopherson <seanjc@google.com>, wu.fei9@sanechips.com.cn
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, anup@brainfault.org, atish.patra@linux.dev,
 pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 pbonzini@redhat.com, shuah@kernel.org
References: <202605111849442561v1a0B_7W1L2Z-ENusLaP@zte.com.cn>
 <202605111130.64BBUXDN013040@mse-fl2.zte.com.cn>
 <agO_0ejKd0x38_-E@google.com>
Content-Language: en-US
From: Wu Fei <atwufei@163.com>
In-Reply-To: <agO_0ejKd0x38_-E@google.com>
X-CM-TRANSID: _____wB30cdFbgRqe32jBA--.12714S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tw13JFy8CryDCFW3Zr13urg_yoW8Kr4UpF
	WSgFyjkr1kAFyrC3Z2ya1YqF1FyFW5ArWUJa4rt345ua98WrsrWr1xKa4rZasrCr1fXr12
	yrWDK347Gwn7uaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UonQUUUUUU=
X-Originating-IP: [240e:38c:8516:b200:c068:c931:3eaf:6c76]
X-CM-SenderInfo: pdwz3wlhl6il2tof0z/xtbCzQlJ6moEbklR1wAA3o
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_052936_316012_5CFE3B5E 
X-CRM114-Status: GOOD (  15.90  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

On 5/13/26 08:03, Sean Christopherson wrote:
> On Mon, May 11, 2026, wu.fei9@sanechips.com.cn wrote:
>> Currently dirty_log_test hardcodes usleep 1ms in each interval, which
>> could be too short for guest to write and fault in enough pages, then
>> there is less chance to test the write protection mechanism, especially
>> in the case of (log_mode != LOG_MODE_DIRTY_RING).
> 
> But when log_mode != LOG_MODE_DIRTY_RING, the individual sleep time is largely
> meaningless, because the test won't reap the bitmaps for iterations > 0.
> 
> 			if (i && host_log_mode != LOG_MODE_DIRTY_RING)
> 				continue;
> 
The first usleep  matters in the case of KVM_DIRTY_LOG_INITIALLY_SET. 
The dirty bitmap is not precise in the first get_dirty_log, all pages 
are marked as dirty but most of them are not populated in page table, 
this creates the situation I mentioned in the cover letter.

"when the range to wp is
[0xfffff01fc000, 0xfffff023c000) , if found_leaf of 0xfffff01fc000
returns false and page_size is 2MB, it skips the whole range, but it's
possible to have valid entries in [0xfffff0200000, 0xfffff023c000), so
only [0xfffff01fc000, 0xfffff0200000) can be skipped safely."

>>
>> Unit is introduced to replace the default 1ms if specified in command
>> line. The following test can't trigger failure on my riscv vm:
> 
> Failure of what?  And does the failure really not reproduce with a higher interval?

On riscv, it fails to write protect some pages with valid page table 
entry then loses track of dirty pages. Higher interval doesn't help 
because only the first usleep matters, after the first 
collect_dirty_pages, all dirty pages are tracked precisely then there is 
no such problem.

> 
>>
>>    # ./dirty_log_test -m 21 -M clear-log
>>
>> By enlarging unit, it fails every time:
> 
> "unit" is way too vague.   Even looking at the code, it's not clear to me what
> you intended a "unit" to be.  I'm not entirely opposed to providing the user with
> more control over the innards of the test, but the interface needs to be somewhat
> intuitive.

Basically, a unit is the time of one usleep(), any suggestions?

Thanks,
Fei.

> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
