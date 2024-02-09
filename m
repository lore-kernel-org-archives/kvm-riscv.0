From: Thomas Huth <thuth@redhat.com>
Date: Fri, 9 Feb 2024 09:44:17 +0100
Subject: [kvm-unit-tests PATCH v3 4/8] migration: Support multiple
 migrations
In-Reply-To: <CZ0EVI7IZ9YY.3EF4ZKA9IXM5I@wheely>
References: <20240209070141.421569-1-npiggin@gmail.com>
 <20240209070141.421569-5-npiggin@gmail.com>
 <74f469c3-76ee-4589-b3ec-17a8b7428950@redhat.com>
 <CZ0EVI7IZ9YY.3EF4ZKA9IXM5I@wheely>
Message-ID: <94104ce8-faab-411a-866f-1d7b2aac78c8@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 09/02/2024 09.39, Nicholas Piggin wrote:
> On Fri Feb 9, 2024 at 6:19 PM AEST, Thomas Huth wrote:
>> On 09/02/2024 08.01, Nicholas Piggin wrote:
>>> Support multiple migrations by flipping dest file/socket variables to
>>> source after the migration is complete, ready to start again. A new
>>> destination is created if the test outputs the migrate line again.
>>> Test cases may now switch to calling migrate() one or more times.
>>>
>>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>>> ---
>> ...
>>> diff --git a/scripts/arch-run.bash b/scripts/arch-run.bash
>>> index 3689d7c2..a914ba17 100644
>>> --- a/scripts/arch-run.bash
>>> +++ b/scripts/arch-run.bash
>>> @@ -129,12 +129,16 @@ run_migration ()
>>>    		return 77
>>>    	fi
>>>    
>>> +	migcmdline=$@
>>> +
>>>    	trap 'trap - TERM ; kill 0 ; exit 2' INT TERM
>>> -	trap 'rm -f ${migout1} ${migout_fifo1} ${migsock} ${qmp1} ${qmp2} ${fifo}' RETURN EXIT
>>> +	trap 'rm -f ${migout1} ${migout2} ${migout_fifo1} ${migout_fifo2} ${migsock} ${qmp1} ${qmp2} ${fifo}' RETURN EXIT
>>>    
>>>    	migsock=$(mktemp -u -t mig-helper-socket.XXXXXXXXXX)
>>>    	migout1=$(mktemp -t mig-helper-stdout1.XXXXXXXXXX)
>>>    	migout_fifo1=$(mktemp -u -t mig-helper-fifo-stdout1.XXXXXXXXXX)
>>> +	migout2=$(mktemp -t mig-helper-stdout2.XXXXXXXXXX)
>>> +	migout_fifo2=$(mktemp -u -t mig-helper-fifo-stdout2.XXXXXXXXXX)
>>>    	qmp1=$(mktemp -u -t mig-helper-qmp1.XXXXXXXXXX)
>>>    	qmp2=$(mktemp -u -t mig-helper-qmp2.XXXXXXXXXX)
>>>    	fifo=$(mktemp -u -t mig-helper-fifo.XXXXXXXXXX)
>>> @@ -142,18 +146,61 @@ run_migration ()
>>>    	qmpout2=/dev/null
>>>    
>>>    	mkfifo ${migout_fifo1}
>>> -	eval "$@" -chardev socket,id=mon1,path=${qmp1},server=on,wait=off \
>>> +	mkfifo ${migout_fifo2}
>>> +
>>> +	eval "$migcmdline" \
>>> +		-chardev socket,id=mon1,path=${qmp1},server=on,wait=off \
>>>    		-mon chardev=mon1,mode=control > ${migout_fifo1} &
>>>    	live_pid=$!
>>>    	cat ${migout_fifo1} | tee ${migout1} &
>>>    
>>> -	# We have to use cat to open the named FIFO, because named FIFO's, unlike
>>> -	# pipes, will block on open() until the other end is also opened, and that
>>> -	# totally breaks QEMU...
>>> +	# The test must prompt the user to migrate, so wait for the "migrate"
>>> +	# keyword
>>> +	while ! grep -q -i "Now migrate the VM" < ${migout1} ; do
>>> +		if ! ps -p ${live_pid} > /dev/null ; then
>>> +			echo "ERROR: Test exit before migration point." >&2
>>> +			qmp ${qmp1} '"quit"'> ${qmpout1} 2>/dev/null
>>> +			return 3
>>> +		fi
>>> +		sleep 0.1
>>> +	done
>>> +
>>> +	# This starts the first source QEMU in advance of the test reaching the
>>> +	# migration point, since we expect at least one migration. Subsequent
>>> +	# sources are started as the test hits migrate keywords.
>>> +	do_migration || return $?
>>> +
>>> +	while ps -p ${live_pid} > /dev/null ; do
>>> +		# Wait for EXIT or further migrations
>>> +		if ! grep -q -i "Now migrate the VM" < ${migout1} ; then
>>> +			sleep 0.1
>>> +		else
>>> +			do_migration || return $?
>>> +		fi
>>> +	done
>>> +
>>> +	wait ${live_pid}
>>> +	ret=$?
>>> +
>>> +	while (( $(jobs -r | wc -l) > 0 )); do
>>> +		sleep 0.1
>>> +	done
>>> +
>>> +	return $ret
>>> +}
>>> +
>>> +do_migration ()
>>> +{
>>> +	# We have to use cat to open the named FIFO, because named FIFO's,
>>> +	# unlike pipes, will block on open() until the other end is also
>>> +	# opened, and that totally breaks QEMU...
>>>    	mkfifo ${fifo}
>>> -	eval "$@" -chardev socket,id=mon2,path=${qmp2},server=on,wait=off \
>>> -		-mon chardev=mon2,mode=control -incoming unix:${migsock} < <(cat ${fifo}) &
>>> +	eval "$migcmdline" \
>>> +		-chardev socket,id=mon2,path=${qmp2},server=on,wait=off \
>>> +		-mon chardev=mon2,mode=control -incoming unix:${migsock} \
>>> +		< <(cat ${fifo}) > ${migout_fifo2} &
>>>    	incoming_pid=$!
>>> +	cat ${migout_fifo2} | tee ${migout2} &
>>>    
>>>    	# The test must prompt the user to migrate, so wait for the "migrate" keyword
>>>    	while ! grep -q -i "Now migrate the VM" < ${migout1} ; do
>>
>> So the old check for the "migrate" keyword is also still around?
> 
> It's just the comment is staleish, it only checks "Now migrate...".
> 
>> Why do we
>> need to wait on two spots for the "Now mirgrate..." string now?
> 
> So that the it ensures we do one migration, subsequent ones are
> optional.
> 
> I was thinking we could just remove that, and possibly even
> remove the MIGRATION=yes/no paths and always just use the same
> code here. But that's for another time.
> 
> Actually there is some weirdness here. There are *three* spots
> where it waits for migration.

Yes, that's what I meant (I considered your two new additions like one spot ;-))

> The first one in run_migration
> can be removed, because it can call do_migration right away
> to start up the destination qemu process ahead of the first
> migration message as-per comment. I'll respin with that change.

Thanks, that sounds good!

  Thomas


